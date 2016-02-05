---
layout: post
title: Create VMFS Datastore Using PowerCLI
categories:
- PowerCLI
comments: true
---
For upcoming testing there was a need to create 140 datastores on a cluster for testing. Who wants to do that much clicking and typing? Not me!
You can use the below PowerCLI commands to get the SCSI ID's,  Create the Datastore and then Rescan all hosts in the cluster.

## How do i get the CanonicalName for allocated disks?

{% highlight powershell %}
Get-SCSILun -VMhost 192.168.1.103 -LunType Disk | Select CanonicalName,Capacity
{% endhighlight %}

## How do I create a VMFS datastore for the CanonicalName I identified above?

{% highlight powershell %}
New-Datastore -VMHost Host -Name Datastore -Path CanonicalName -VMFS
{% endhighlight %}

## How do i rescan all the hosts in the cluster to see the new datastore?<br />

{% highlight powershell %}
Get-Cluster -name Cluster | Get-VMhost | Get-VMHostStorage -RescanAllHBA
{% endhighlight %}
