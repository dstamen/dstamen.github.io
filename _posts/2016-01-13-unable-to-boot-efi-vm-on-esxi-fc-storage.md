---
layout: post
title: "Unable to Boot EFI VM on ESXi FC Storage"
categories:
- VMware
comments: true
---
For the past week, I have been troubleshooting the strangest issue. I have been attempting to move some Windows 8.1 VM's from our legacy datacenter(iSCSI) to our new datacenter(FC).

Whenever I would move the VM to our new DC, it would fail to boot properly. It would boot straight to Windows Recovery. If I moved the same VM to any other type of storage(NFS, iSCSI, Local) the VM would boot perfectly fine. I opened a case with VMware and our Storage vendor and no one had any idea what was causing it.

Strangely enough my coworker found the following article today that explains and provides a workaround. [KB2137402](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2137402)

Also, our storage vendor Pure Storage also had an article explaining the issue. [Windows-2012-R2-and-Windows-8-boot-fails-after-Storage-VMotion]http://community.purestorage.com/t5/Pure-Customer-Knowledge-Base/Windows-2012-R2-and-Windows-8-boot-fails-after-Storage-VMotion/ta-p/4109]

So today I went and modified a host to have the DiskMaxIOSize to be 4096 instead of the default 32767, and the VM booted up fine! All my stress and troubleshooting could finally be resolved. Strange enough this issue has been around since 5.5 and there is still no actual resolution. I am not even sure if this is an array or VMware issue as this seems to affect 3Par and XtremIO as well.

However, since I had to replicate this change to a bunch of hosts I created a script to make this change.

####***Link to Script***
- [Set-MaxDiskIO.ps1](https://github.com/dstamen/PowerCLI/blob/master/Set-MaxDiskIO.ps1)

####***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

{% highlight powershell %}
# PowerCLI Script for setting Disk Max IO Size
# @davidstamen
# http://davidstamen.com

#Define Variables
$cred = Get-Credential
$VC = "vc.lab.local"
$Cluster = "Production"

#Connect to vCenter
Connect-VIServer $VC -Credential $cred

#Get all Hosts
$esxHosts = Get-Cluster $Cluster | Get-VMHost | Where { $_.PowerState -eq "PoweredOn" -and $_.ConnectionState -eq "Connected" } | Sort Name

#For each host set DiskMaxIOsize to 4MB
foreach ($esx in $esxHosts) {
  Get-AdvancedSetting -Entity $esx -Name Disk.DiskMaxIOSize | Set-AdvancedSetting -Value 4096 -Confirm:$false
}
{%endhighlight%}


####***Execute the Script***
- Run .\Set-MaxDiskIO.ps1

Hopefully this helps anyone else who comes across this issue, not alot of people have seen it.
