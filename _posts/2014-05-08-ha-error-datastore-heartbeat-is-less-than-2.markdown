---
layout: post
title: 'HA Error: Datastore Heartbeat is less than 2'
categories:
- VMware
comments: true
---
If you are configuring a cluster with less than 2 datastores, you will receive an HA warning "The number of heartbeat datastores for host is 1, which is less than required: 2" You can add an option to the HA Advanced Options to supress this warning.

1. Log in to vCenter Server
2. Right-click the cluster and click **Edit Settings**
3. Click vSphere **HA > Advanced Options**
4. Under Option, add an entry for **das.ignoreInsufficientHbDatastore**
5. Under Value, type **true**
6. Click **Cluster Features**
7. De-select **Turn on vSphere HA** and click **OK**
8. Wait for all the hosts in the cluster to re-configure HA, then right-click the cluster and click **Edit Settings**
9. Click **Cluster Features**
10. Click **Turn on vSphere HA**
11. Click **OK**
