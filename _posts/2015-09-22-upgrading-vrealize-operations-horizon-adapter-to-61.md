---
layout: post
title: "Upgrading vRealize Operations Horizon Adapter to 6.1"
categories:
- vRealize Operations
comments: true
---
vRealize Operations 6.1 is now available, I thought I would put a quick guide together as I go through the upgrade process. This guide will show how to upgrade the Horizon Adapter for vROPS.

To upgrade from vRealize Operations Horizon Adapter to the most recent version, follow these steps.

[Download](https://my.vmware.com/web/vmware/info?slug=desktop_end_user_computing/vmware_vrealize_operations_for_horizon_and_published_applications/6_0) the neccessary file(s) needed. In my case I needed the vRealize Operations for Horizon Broker Agent and the vRealize Operations for Horizon Adapter.

- Log on to the View Connection server where the previous broker agent is installed.
  - Select the **vRealize Operations View Broker Agent Settings** and stop the Broker Agent Service.
- Log on to the vRealize Operations Manager user interface with administrative permissions.
  - On the left pane select **Administration** and then **Solutions.**
  - On the **Solutions** tab, select **VMware Horizon** and click the Add icon.
  - Browse to the **Horizon Adapter** that you downloaded and select the .PAK file.
  - Select **Install the PAK file even if it is already installed. and Reset predefined content to a newer version provided by this update.** and click **Upload**
  ![](/images/viewvrops61upgrade1.png)
  - Accept the **EULA.**
  - Click **Finish** when the upgrade Completes.
- Log back on to the View Connection Server where the previous broker agent is installed.
  - Run the **vRealize Operations for Horizon Broker Agent** file that you downloaded above.
  - When finished, select the **vRealize Operations View Broker Agent Settings** and start the Broker Agent Service.

***vRealize Operations Horizon Adapter is now upgraded! Now time to play with the new features.***
