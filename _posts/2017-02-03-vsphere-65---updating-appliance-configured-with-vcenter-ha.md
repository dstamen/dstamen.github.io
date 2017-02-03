---
layout: post
title: "vSphere 6.5 - Updating Appliance configured with vCenter HA"
categories:
- VMware
comments: true
---
The first vSphere 6.5 Patch (6.5a) was just released! So far it seems there are a few critical fixes but the biggest feature is NSX 6.3 support.

[vCenter Server 6.5a Release Notes](http://pubs.vmware.com/Release_Notes/en/vsphere/65/vsphere-vcenter-server-650a-release-notes.html)

[ESXi Server 6.5a Release Notes](http://pubs.vmware.com/Release_Notes/en/vsphere/65/vsphere-esxi-650a-release-notes.html)

You can find patch information here. https://kb.vmware.com/kb/2148330

- To download patch do not go to my.vmware.com, you need to navigate to the VMware Patch Download Center(https://my.vmware.com/group/vmware/patch) and select VC from the **Search by Product** drop down, and then vSphere 6.5
- You will then download the VMware-vCenter-Server-Appliance-6.5.0.5200-4944578-patch-FP.iso

![](/images/v65up3.png)

Now that we have all the files we need, we can proceed with the actual upgrade.

* Log into the vSphere webclient and put the vCenter HA into Maintenance Mode. Maintenance mode means replication still occurs but automatic failover is disabled.
    - Under Settings, select vCenter HA and click Edit.
    - Select Maintenance Mode and click OK.

        ![](/images/v65up2.png)
        ![](/images/v65up1.png)

* SSH as root to the appliance shell of the Active Node using the Public IP.
    - Note: Make sure you are not in *shell* but in *appliancesh*

* While in SSH of the active node, SSH to the witness node IP.
    - Note: Make sure you are not in *shell* but in *appliancesh*

* We will now stage the patches to the witness node.
    - You will need to attach the patch .ISO you downloaded previously, as you cannot update straight from the URL since the witness/passive do not have internet access.
    - To stage the patches run the following command.
        - software-packages stage --iso --acceptEulas

```
Command> software-packages stage --iso --acceptEulas
 [2017-02-03T07:44:01.034] : ISO mounted successfully
 [2017-02-03T07:44:01.034] : Staged 34 packages.
 [2017-02-03T07:44:01.034] : Verifying staging area
 [2017-02-03T07:44:01.034] : ISO unmounted successfully
 [2017-02-03T07:44:01.034] : Staging process completed successfully
```

* We will now install the staged patches to the witness node.
    - To install the patches run the following command.
        - software-packages install --staged --acceptEulas

```
Command> software-packages install --staged --acceptEulas
 [2017-02-03T07:46:10.034] : Validating software update payload
 [2017-02-03T07:46:10.034] : Validation successful
 [2017-02-03 07:46:10,986] : Copying software packages  [2017-02-03T07:46:11.034] : ISO mounted successfully
34/34
 [2017-02-03T07:46:21.034] : ISO unmounted successfully
 [2017-02-03 07:46:21,745] : Running test transaction ....
 [2017-02-03 07:46:22,757] : Running pre-install script.....
 [2017-02-03T07:46:24.034] : All VMware services are stopped.
 [2017-02-03 07:46:24,977] : Upgrading software packages ....
 [2017-02-03 07:47:01,087] : Running post-install script.....
 [2017-02-03T07:47:02.034] : Packages upgraded successfully, Reboot is required to complete the installation.
```

* We will now reboot the witness node.
    - To reboot the witness node, while still in appliancesh run the following command.
        - shutdown reboot -r "patch reboot"

* While in SSH of the active node, SSH to the passive node IP.
    - Note: Make sure you are not in *shell* but in *appliancesh*
    
* We will now stage the patches to the passive node.
    - You will need to attach the patch .ISO you downloaded previously, as you cannot update straight from the URL since the witness/passive do not have internet access.
    - To stage the patches run the following command.
        - software-packages stage --iso --acceptEulas
        
```
Command> software-packages stage --iso --acceptEulas
 [2017-02-03T12:56:34.034] : ISO mounted successfully
 [2017-02-03T12:56:34.034] : Staged 34 packages.
 [2017-02-03T12:56:34.034] : Verifying staging area
 [2017-02-03T12:56:35.034] : ISO unmounted successfully
 [2017-02-03T12:56:35.034] : Staging process completed successfully
```

* We will now install the staged patches to the passive node.
    - To install the patches run the following command.
        - software-packages install --staged --acceptEulas

```
Command> software-packages install --staged --acceptEulas
 [2017-02-03T12:56:57.034] : Validating software update payload
 [2017-02-03T12:56:57.034] : Validation successful
 [2017-02-03 12:56:57,376] : Copying software packages  [2017-02-03T12:56:57.034] : ISO mounted successfully
34/34
 [2017-02-03T12:57:07.034] : ISO unmounted successfully
 [2017-02-03 12:57:07,957] : Running test transaction ....
 [2017-02-03 12:57:08,966] : Running pre-install script.....
 [2017-02-03T12:57:10.034] : All VMware services are stopped.
 [2017-02-03 12:57:10,684] : Upgrading software packages ....
 [2017-02-03 12:57:34,750] : Running post-install script.....
 [2017-02-03T12:57:36.034] : Packages upgraded successfully, Reboot is required to complete the installation.
```

* We will now reboot the passive node.
    - To reboot the passive node, while still in appliancesh run the following command.
        - shutdown reboot -r "patch reboot"

* Once the witness and passive nodes are online we will do a manual failover of the cluster.
    - Log in to the vSphere Web Client select the vCenter and click Configure.
    - Under Settings, select vCenter HA and click Initiate Failover.
    - Click Yes to start the failover.

* SSH as root to the appliance shell of the active node using the public IP.
    - Note: Make sure you are not in *shell* but in *appliancesh*

* While in SSH of the active node, SSH to the new passive node IP.
    - Note: Make sure you are not in *shell* but in *appliancesh*

* We will now stage the patches to the new passive node.
    - You will need to attach the patch .ISO you downloaded previously, as you cannot update straight from the URL since the witness/passive do not have internet access.
    - To stage the patches run the following command.
        - software-packages stage --iso --acceptEulas

```
Command> software-packages stage --iso --acceptEulas
 [2017-02-03T08:10:08.034] : ISO mounted successfully
 [2017-02-03T08:10:09.034] : Staged 34 packages.
 [2017-02-03T08:10:09.034] : Verifying staging area
 [2017-02-03T08:10:09.034] : ISO unmounted successfully
 [2017-02-03T08:10:09.034] : Staging process completed successfully
```

* We will now install the staged patches to the new passive node.
    - To install the patches run the following command.
        - software-packages install --staged --acceptEulas

```
Command> software-packages install --staged --acceptEulas
 [2017-02-03T08:10:27.034] : Validating software update payload
 [2017-02-03T08:10:27.034] : Validation successful
 [2017-02-03 08:10:27,512] : Copying software packages  [2017-02-03T08:10:27.034] : ISO mounted successfully
34/34
 [2017-02-03T08:10:37.034] : ISO unmounted successfully
 [2017-02-03 08:10:37,780] : Running test transaction ....
 [2017-02-03 08:10:38,790] : Running pre-install script.....
 [2017-02-03T08:10:40.034] : All VMware services are stopped.
 [2017-02-03 08:10:40,401] : Upgrading software packages ....
 [2017-02-03 08:11:05,450] : Running post-install script.....
 [2017-02-03T08:11:06.034] : Packages upgraded successfully, Reboot is required to complete the installation.
```

* We will now reboot the new passive node.
    - To reboot the witness node, while still in appliancesh run the following command.
        - shutdown reboot -r "patch reboot"

* We will now wait for the passive node to come online, and then remove vCenter HA from Maintenance Mode.
    - Log in to the vSphere Web Client select the vCenter and click Configure.
    - Under Settings, select vCenter HA and click Edit.
    - Select Enable vCenter HA and click OK.

The upgrade is now done! After previously having to do VMware Heartbeat upgrades, this is definately much easier. This process is very straightforward and I had no issues.

All in all this process took my less than 30 minutes to fully upgrade with no major issues.

Leave a comment if you have any questions!
