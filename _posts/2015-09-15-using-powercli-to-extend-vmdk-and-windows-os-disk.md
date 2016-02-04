---
layout: post
title: "Using PowerCLI to Extend VMDK and Windows OS Disk"
categories:
- PowerCLI
comments: true
---
I wanted to share this handy script i created when you have a need to extend a disk.

This script can be extremely handy as it will take care of extending the VMDK and then going to the OS and then performing the expansion there as well. This has been helpful when needing to extend a large batch of servers (60+).

**Syntax:** .\ExtendVMDKandGuest VMNAME

You will then be prompted to enter in the Hard Disk #, the size you want to be extended, and then which drive letter that volume belongs to.

The code and Github Link can be found below.

[ExtendVMDKandGuest.ps1](https://github.com/dstamen/PowerCLI/blob/master/ExtendVMDKandGuest.ps1)
{% highlight powershell %}
# PowerCLI Script for adding vmdk to VM and extending disk in windows
# @davidstamen
# http://davidstamen.com

param(
  [string]$VM
)
$VM = Get-VM $VM
Get-VM $VM|Get-HardDisk|FT Parent, Name, CapacityGB -Autosize
$HardDisk = Read-Host "Enter VMware Hard Disk (Ex. 1)"
$HardDisk = "Hard Disk " + $HardDisk
$HardDiskSize = Read-Host "Enter the new Hard Disk size in GB (Ex. 50)"
$VolumeLetter = Read-Host "Enter the volume letter (Ex. c,d,e,f)"
Get-HardDisk -vm $VM | where {$_.Name -eq $HardDisk} | Set-HardDisk -CapacityGB $HardDiskSize -Confirm:$false
Invoke-VMScript -vm $VM -ScriptText "echo rescan > c:\diskpart.txt && echo select vol $VolumeLetter >> c:\diskpart.txt && echo extend >> c:\diskpart.txt && diskpart.exe /s c:\diskpart.txt" -ScriptType BAT
{% endhighlight %}
