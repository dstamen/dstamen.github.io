---
layout: post
title: "Upgrading vRealize Operations to 6.1"
categories:
- vRealize Operations
comments: true
---
vRealize Operations 6.1 is now available, I thought I would put a quick guide together as I go through the upgrade process.

To upgrade from vRealize Operations Manager to the most recent version, follow these steps.

[Download](https://my.vmware.com/group/vmware/details?productId=538&downloadGroup=VROPS-610) the PAK file(s) needed based on the type of cluster.

- vApp clusters
  - The vApp cluster requires the deployment of the OS upgrade and the product upgrade .pak files.
    - For an OS upgrade, the file is: vRealize_Operations_Manager-VA-OS-xxx.pak
    - For the product upgrade of vApp clusters, the file is: vRealize_Operations_Manager-VA-xxx.pak
- vApp heterogeneous clusters
  - The vApp heterogeneous cluster requires the deployment of the OS upgrade and the product upgrade .pak files.
    - For an OS upgrade, the file is: vRealize_Operations_Manager-VA-OS-xxx.pak
    - For the product upgrade of a heterogeneous cluster that has VA nodes with Windows Remote Collectors, the file is: vRealize_Operations_Manager-VA-WIN-xxx.pak
- RHEL standalone clusters
  - The RHEL standalone cluster requires the deployment of only the product upgrade .pak file.
  - For the product upgrade of RHEL clusters, the file is: vRealize_Operations_Manager-RHEL-xxx.pak
- RHEL heterogeneous clusters
  - The RHEL heterogeneous cluster requires the deployment of only the product upgrade .pak file.
  - For the product upgrade of a heterogeneous cluster that has RHEL nodes with Windows Remote Collectors, the file is: vRealize_Operations_Manager-RHEL-WIN-xxx.pak
- Windows clusters
  - The Windows cluster requires the deployment of only the product upgrade .pak file.
  - For the product upgrade of Windows clusters, the file is: vRealize_Operations_Manager-WIN-xxx.pak

The rest of the upgrade process is pretty straightforward.

- On your existing vRealize Operations Manager cluster, log in to the administrator interface. https://FQDN/admin
- On the left, click **Software Update**.
- Click **Install a Software Update.**
- Perform the OS upgrade.
  - Select the .PAK file as listed above.
  - Once uploaded, you will get the details that it is ready to install. Click Next
  ![](/images/vrops61upgrade1.png)
  - Accept the EULA
  - You may get disconnected. Log back on and view the Software Update tab and you can see when the update is complete.
  ![](/images/vrops61upgrade2.png)
- Install the cluster upgrade file.
  - Select the .PAK file as listed above.
  - Once uploaded, you will get the details that it is ready to install. Click Next
  ![](/images/vrops61upgrade3.png)
  - Accept the EULA
  - You may get disconnected. Log back on and view the Software Update tab and you can see when the update is complete.

***vRealize Operations is now upgraded! Now proceed to update any adapters.***
