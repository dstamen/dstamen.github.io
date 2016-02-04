---
layout: post
title: vSphere 5.x Storage vMotion Does Not Rename Virtual Machine Files.
categories:
- VMware
comments: true
---
After upgrading vCenter this functionality is no longer enabled by default. Please perform the following steps to enable rename of files upon successful Storage vMotion.

1. Log into the vSphere Client as an Administrator
2. Click **Administration > vCenter Server Settings**
3. Click **Advanced Settings**
4. Add this advanced parameter key:
- provisioning.relocate.enableRename
5. Set the value to: **true**
6. Click **Add**
7. Click **OK**
8. Restart the VMware VirtualCenter Server service for the changes to take effect
