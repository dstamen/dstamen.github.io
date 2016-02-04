---
layout: post
title: 'HA Error: Network Redundancy'
categories:
- VMware
comments: true
---
When setting up a cluster for testing you may not have 2 nics to use for management. to bypass the warning you can configure HA to not alert you for this issue.

##To perform the steps in the c# client.
1. From the VMware Infrastructure Client, right-click on the cluster and click **Edit Settings**.
2. Select **vSphere HA** and click **Advanced Options**.
3. In the Options column, enter **das.ignoreRedundantNetWarning**
4. In the Value column, type **true**
5. Click **OK**.
6. Right-click the host and click **Reconfigure for vSphere HA**. This reconfigures HA.

##To perform the steps in the webclient.
1. From the vSphere Web Client, right click on the cluster.
2. Click on the <b style="font-style: inherit;">Manage</b> tab for the cluster, then under Settings click <b style="font-style: inherit;">vSphere HA</b>.
3. Click on the <b style="font-style: inherit;">Edit</b> button in the top right corner.
4. Expand the <b style="font-style: inherit;">Advanced Options</b> section, and click <b style="font-style: inherit;">Add</b>.
5. In the Options column, type **das.ignoreRedundantNetWarning.**
6. In the Value column, type **true**.
7. Click **OK**
8. Right-click the host and click **Reconfigure for vSphere HA**.
