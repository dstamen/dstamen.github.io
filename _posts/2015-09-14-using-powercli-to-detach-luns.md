---
layout: post
title: "Using PowerCLI to Detach Luns"
categories:
- PowerCLI
comments: true
---
I thought I would share this script, its been circulating a bit but I feel it is a nice one to have in your toolkit.

Have you ever had to remove a LUN from a cluster and thought "Do I really need to detach all the LUN's, before un-mapping from my SAN?"

1. Unmount Datastore
2. Detach LUN
3. Un-map from SAN
4. Rescan Cluster

Well here is a handy script with output. All you need to do is unmount your datastore(s), and then enter in your naaid of your LUN's and the cluster you want to remove it from, save it an execute. All the LUN's will be detached without having to manually go and detach it from every LUN in your cluster.

The code and Github Link can be found below.

[Detach-ScsiLun.ps1](https://github.com/dstamen/PowerCLI/blob/master/Detach-SCSILun.ps1)
{% highlight powershell %}
# PowerCLI Script for detaching luns from a cluster
# @davidstamen
# http://davidstamen.com

LunIDs = "naa.6000000001","naa.600000002"
$Clustername = "MyCluster"

function Detach-Disk {
    param(
        [VMware.VimAutomation.ViCore.Impl.V1.Inventory.VMHostImpl]$VMHost,
        [string]$CanonicalName    )

    $storSys = Get-View $VMHost.Extensiondata.ConfigManager.StorageSystem
    $lunUuid = (Get-ScsiLun -VmHost $VMHost | where {$_.CanonicalName -eq $CanonicalName}).ExtensionData.Uuid

    $storSys.DetachScsiLun($lunUuid)
}

$ClusterHosts = Get-Cluster $Clustername | Get-VMHost

Foreach($VMHost in $ClusterHosts)
{
    Foreach($LUNid in $LunIDs)
    {
        Write-Host "Detaching" $LUNid "from" $VMHost -ForegroundColor "Yellow"
        Detach-Disk -VMHost $VMHost -CanonicalName $LUNid
    }
}

{% endhighlight %}
