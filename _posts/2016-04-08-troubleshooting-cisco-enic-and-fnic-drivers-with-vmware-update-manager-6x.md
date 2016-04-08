---
layout: post
title: "Troubleshooting Cisco ENIC and FNIC Drivers with VMware Update Manager 6.x"
categories:
- VMware
- Cisco
comments: true
---
I have been having issues ever since I updated to vSphere 6.x getting the Cisco Drivers to properly update through VMware Update Manager(VUM). Every time I would run through a compliance check, they would always report they were up to date even when they were running an older version.

I have recently made a breakthrough working with VMware Support and stumbling through some old blogs. Cisco Support has been terrible on this issue and after repeated attempts to get this case escalated i think the 10th time is a charm.

From what I have found the issue lies in the metadata of the offline bundle. As you can see in the below screenshot. The ENIC driver is showing 6.x but the FNIC driver is showing 5.x. In this case the ENIC driver works and the FNIC driver does not.

**Note: The ENIC driver for 2.3.0.7 was recently updated to fix this, but every other driver is currently broken.**

![](/images/vummetadata.png)

To update the metadata of the offline bundle and get VUM to work you need to perform the following steps.


- Make sure you have 7zip and setup an editor within 7zip. I used notepad++.

  ![](/images/7zipeditor.png)

- Open the offline_bundle zip file
- Edit the vendor-index.xml file and replace the **5** with **6**

  ![](/images/vendorindexxml.png)

- Open up the metadata.zip file
- Edit the vendor-index.xml file and replace the **5** with **6**

  ![](/images/vendorindexxml.png)

- Edit the vmware.xml file and replace the **5** with **6**

  ![](/images/vmwarexml.png)

If you perform these steps, you can now import your customized offline bundle and it will accurately report 6.x in VUM and allow you to remediate your hosts. Please post any feedback below!
