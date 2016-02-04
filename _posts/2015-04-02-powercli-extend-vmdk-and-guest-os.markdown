---
layout: post
title: PowerCLI - Extend VMDK and Guest OS
categories:
- PowerCLI
comments: true
---
So as always things change across multiple Window's operating systems and VMware revisions. I had a need to extend the drives on about 50 VMs today and really didn't want to do all that clicking. I remember awhile back it was easy to do this with a Basic Set-Harddisk and use the -ResizeGuestPartition but alas that has been removed from the current functionality. So I took my search to google and found a couple scripts that worked ok, but nothing that was a seamless experience.

I will be sharing it with you to save you the time. The script is very simple all you need to do is pass it the VM Name, VMware Hard Disk #, New Hard Disk Size in GB, and the Volume Letter.</p>
{% highlight powershell %}
param(
  [string]$VM
)
$VM = Get-VM $VM
$HardDisk = Read-Host "Enter VMware Hard Disk (Ex. 1)"
$HardDisk = "Hard Disk " + $HardDisk
$HardDiskSize = Read-Host "Enter the new Hard Disk size in GB (Ex. 50)"
$VolumeLetter = Read-Host "Enter the volume letter (Ex. c,d,e,f)"
Get-HardDisk -vm $VM | where {$_.Name -eq $HardDisk} | Set-HardDisk -CapacityGB $HardDiskSize -Confirm:$false
Invoke-VMScript -vm $VM -ScriptText "echo select vol $VolumeLetter > c:\diskpart.txt && echo extend >> c:\diskpart.txt && diskpart.exe /s c:\diskpart.txt" -ScriptType BAT
{% endhighlight %}
Once done, you can execute the script by running .\ScriptName.ps1 VMname as seen in the below screenshot.

![](/images/Screen-Shot-2015-04-02-at-4.35.00-PM.png)
