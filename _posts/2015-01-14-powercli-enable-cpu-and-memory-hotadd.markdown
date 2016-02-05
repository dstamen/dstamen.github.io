---
layout: post
title: PowerCLI - Enable CPU and Memory HotAdd
categories:
- PowerCLI
comments: true
---
I had a need to enable CPU and Memory hotadd to many virtual machines prior to a template being updated, doing some research there is no easy way, however there are some functions out there to do it. You can copy and paste each function into a powershell window and then run the associated command.

{% highlight powershell %}
Enable-MemHotAdd $ServerName
Disable-MemHotAdd $ServerName
Enable-vCPUHotAdd $ServerName
Disable-vCPUHotAdd $ServerName
{% endhighlight %}

# Enable Memory HotAdd
{% highlight powershell %}
Function Enable-MemHotAdd($vm){
$vmview = Get-vm $vm | Get-View
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$extra = New-Object VMware.Vim.optionvalue
$extra.Key="mem.hotadd"
$extra.Value="true"
$vmConfigSpec.extraconfig += $extra
$vmview.ReconfigVM($vmConfigSpec)
}
{% endhighlight %}

# Disable Memory HotAdd
{% highlight powershell %}
Function Disable-MemHotAdd($vm){
$vmview = Get-VM $vm | Get-View
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$extra = New-Object VMware.Vim.optionvalue
$extra.Key="mem.hotadd"
$extra.Value="false"
$vmConfigSpec.extraconfig += $extra
$vmview.ReconfigVM($vmConfigSpec)
}
{% endhighlight %}
# Enable CPU HotAdd
{% highlight powershell %}
Function Enable-vCpuHotAdd($vm){
$vmview = Get-vm $vm | Get-View
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$extra = New-Object VMware.Vim.optionvalue
$extra.Key="vcpu.hotadd"
$extra.Value="true"
$vmConfigSpec.extraconfig += $extra
$vmview.ReconfigVM($vmConfigSpec)
}
{% endhighlight %}
# Disable CPU HotAdd
{% highlight powershell %}
Function Disable-vCpuHotAdd($vm){
$vmview = Get-vm $vm | Get-View
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$extra = New-Object VMware.Vim.optionvalue
$extra.Key="vcpu.hotadd"
$extra.Value="false"
$vmConfigSpec.extraconfig += $extra
$vmview.ReconfigVM($vmConfigSpec)
}
{% endhighlight %}

#### Notes: Enabling CPU Hotadd disables vNUMA. So enable enable this if its really neccessary in your environment.
[KB2040375](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2040375)
