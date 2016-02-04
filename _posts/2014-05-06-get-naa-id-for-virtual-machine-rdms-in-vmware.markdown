---
layout: post
title: Get NAA.ID for Virtual Machine RDM's in VMware
categories:
- PowerCLI
comments: true
---
This is a great script to keep handy. If you have multiple RDM's on a VM and need to get the NAA_ID for them the below PowerCLI command will get you that information.

{% highlight powershell %}
Get-VM VMNAME| Get-HardDisk -DiskType "RawPhysical","RawVirtual" | Select Parent,Name,DiskType,ScsiCanonicalName,DeviceName,CapacityGB | fl
{% endhighlight %}

![](/images/naaid.png)

If you then need to match the SCSI virtual disk to the Guest OS this is a great article on how to do so.

[KB2051606](http://kb.vmware.com/selfservice/microsites/search.do?cmd=displayKC&amp;docType=kc&amp;externalId=2051606)
