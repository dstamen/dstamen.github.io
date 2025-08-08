MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="==BOUNDARY=="

--==BOUNDARY==
MIME-Version: 1.0
Content-Type: text/ipxe; charset="utf-8"

#!ipxe
#==============================================================================
#
# Pre-Boot iSCSI Script
#
# This script is intended to handle the iPXE Boot to Allow Boot From SAN
#
#==============================================================================

# --- iPXE Variables ---
set initiator-iqn iqn.2010-04.org.ipxe:ubuntu1
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
# Post-Boot Setup Script
#
# This script is intended to run after an OS has been SAN-booted via iPXE.
# It configures the OS and Installs Packages
#
#==============================================================================

# --- Helper function for logging ---
log() {
    echo "=> $(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# --- Initial System and User Setup ---
log "Updating system and installing necessary packages..."
apt update -y && apt upgrade -y
apt install -y nginx

log "Script finished"

--==BOUNDARY==--
