#!ipxe

# --- iPXE Variables ---
set initiator-iqn iqn.2010-04.org.ipxe:ubuntu1
set target-ip1 172.18.10.68
set target-ip2 172.18.10.92
set array-iqn iqn.2010-06.com.purestorage:flasharray.22a52e281e6dbb52

# --- iPXE Boot Commands ---
dhcp
sanboot iscsi:${target-ip1}:::1:${array-iqn} iscsi:${target-ip2}:::1:${array-iqn}
