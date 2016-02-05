---
layout: post
title: vSphere Data Protection - Insufficient Disk Space for Upgrade
categories:
- VMware Data Protection
comments: true
---
As I was upgrading my VDP-A environment from 5.5 to 5.8 the upgrade failed due to the following error.

"Please make sure you have at least 20GB for repo, 10GB for var, and 1GB for root partition."

![](/images/vdpa-diskspace1.jpg)

Upon further research there seems to be an issue from 5.5.1 and 5.5.5 appliances with the /space partition filling up due to PostGres events. The issue can be resolving by installing the following VDP patch (vdp_patch-5.5.5.190.)

[KB2067635](http://kb.vmware.com/kb/2067635)

# The installation is pretty straightforward.
1. Download the patch
- [VDP](https://my.vmware.com/web/vmware/details?downloadGroup=VDP55_5&productId=351&rPId=4857)
- [VDP-Advanced](https://my.vmware.com/web/vmware/details?downloadGroup=VDPADV55_5&productId=375&rPId=4606)
3. Copy the patch file to the VDP appliance and place it in the /root directory using filezilla/winscp
4. Using an SSH session or the console of the VDP appliance, log in as root and run these commands:
- chmod +x vdp_patch-5.5.5.190.run
- sh vdp_patch-5.5.5.190.run

After the installation is complete, verify all the services are running and you are good to go.
