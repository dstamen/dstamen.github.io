---
layout: post
title: Sysprep runs repeatedly on virtual machines deployed to ESXi 5.1 build 1743533
categories:
- PowerCLI
comments: true
---
We had a strange issue that any time a VM was snapshotted it then forced a reboot and sysprep. Reviewing the customization logs(C:\windows\temp\vmware-imc\guestcust.log) I noticed the following error..Unable to set customization status in vmx.

Upon further research it seems this is a known issue and is resolved in ESXi 5.1 Express Patch 5 [KB2077640](http://kb.vmware.com/selfservice/search.do?cmd=displayKC&docType=kc&docTypeID=DT_KB_1_1&externalId=2077640) as referenced in this article [KB2078352](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2078352).

However the hotfix only fixes future occurences, you still need to fix all the VMs affected. See below for the powercli script I created to connect to all my vcenters, get VM's that are affected and then fix them. Please note as this is not referenced in the KB that the VM will need to be POWERED OFF and then POWERED ON for the change to go into affect. A restart will not fix it.

{% highlight powershell %}
Connect-VIServer vcenter.lab.local
$VMs = Get-VM | Get-AdvancedSetting -Name tools.deployPkg.fileName | Where-Object {$_.Value -ne ""}
$VMs | Select Entity, Value
$VMs | ForEach {Get-VM $_.Entity | Get-AdvancedSetting -Name tools.deployPkg.fileName | Set-AdvancedSetting -Value '' -Confirm:$false}
{% endhighlight %}
