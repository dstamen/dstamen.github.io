MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="==BOUNDARY=="

--==BOUNDARY==
MIME-Version: 1.0
Content-Type: text/ipxe; charset="utf-8"

#!ipxe

# --- iPXE Variables ---
set initiator-iqn iqn.2010-04.org.ipxe:ubuntu2
set target-ip1 172.18.10.68
set target-ip2 172.18.10.92
set array-iqn iqn.2010-06.com.purestorage:flasharray.22a52e281e6dbb52

# --- iPXE Boot Commands ---
dhcp
sanboot iscsi:${target-ip1}:::1:${array-iqn} iscsi:${target-ip2}:::1:${array-iqn}

--==BOUNDARY==
MIME-Version: 1.0
Content-Type: text/x-shellscript; charset="utf-8"

#!/bin/bash

#==============================================================================
#
# Post-Boot iSCSI LUN Setup Script for Non-MPIO Environments
#
# This script is intended to run after an OS has been SAN-booted via iPXE.
# It configures the OS to connect to a data LUN, format it, and mount it
# using a persistent device name provided by the system.
#
#==============================================================================

# --- Configuration ---
# These variables should align with the iPXE script and your environment.
ISCSI_TARGET_IP1="172.18.10.68"
ISCSI_TARGET_IP2="172.18.10.92"
INITIATOR_IQN="iqn.2010-04.org.ipxe:ubuntu2"
VOLUME_MNT="/data"
# --- End Configuration ---

# --- Helper function for logging ---
log() {
    echo "=> $(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# --- Initial System and User Setup ---
log "Updating system and installing necessary packages..."
apt update -y && apt upgrade -y
apt install -y open-iscsi multipath-tools fio

# --- iSCSI Configuration and Login ---
log "Starting and enabling iSCSI services..."
systemctl enable --now iscsid.service

log "Configuring initiator IQN to ${INITIATOR_IQN}..."
echo "InitiatorName=${INITIATOR_IQN}" > /etc/iscsi/initiatorname.iscsi
systemctl restart iscsid.service

log "Discovering iSCSI targets..."
iscsiadm -m discovery -t st -p ${ISCSI_TARGET_IP1}
iscsiadm -m discovery -t st -p ${ISCSI_TARGET_IP2}

log "Logging into iSCSI targets..."
iscsiadm -m node -p ${ISCSI_TARGET_IP1} --login
iscsiadm -m node -p ${ISCSI_TARGET_IP2} --login

log "Setting iSCSI sessions to log in automatically on boot..."
iscsiadm -m node -L automatic

log "Increase iSCSI Sessions..."
#

log "Rescanning for new devices..."
rescan-scsi-bus.sh

log "Updating multipath configuration..."
systemctl enable  multipathd
systemctl restart multipathd

log "Mounting multipath device..."
mkdir -p ${VOLUME_MNT}


# Find the multipath device name
disk=$(multipath -ll | head -n 1 | awk '{print $1}')
log "Found multipath device: /dev/mapper/${disk}"

# Check if a filesystem already exists on the device
log "Checking for existing filesystem on /dev/mapper/${disk}..."
if ! blkid /dev/mapper/${disk} > /dev/null 2>&1; then
    # No filesystem was found, so it's safe to format
    log "No filesystem detected. Formatting device with ext4..."
    mkfs.ext4 /dev/mapper/${disk}
else
    # A filesystem already exists, so skip formatting
    log "Filesystem already exists on /dev/mapper/${disk}. Skipping format."
fi

# Check if an entry for the mount point already exists before adding it
if ! grep -q " ${VOLUME_MNT} " /etc/fstab; then
    echo "Adding fstab entry for ${VOLUME_MNT}..."
    echo "/dev/mapper/${disk}  ${VOLUME_MNT}  ext4  defaults,nofail  0  2"| tee -a /etc/fstab
    systemctl daemon-reload
else
    echo "fstab entry for ${VOLUME_MNT} already exists. Skipping."
fi

# Mount the device using the new fstab entry
log "Mounting device..."
mount -a
log "Script finished. Multipath device mounted at ${VOLUME_MNT} and configured for persistence."


--==BOUNDARY==--
