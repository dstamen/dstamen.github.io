---
layout: post
title: Configuring ESXi 5.5 Dump Collector
categories:
- PowerCLI
comments: true
---
Thank you to everyone who listened to me on the EMEA vBrownbag. Here are copies of documentation and scripts on how to configure ESXi to use the remote dump collector.

#Check the ESXi Dump Collector Configuration Example:
{% highlight powershell %}
Foreach ($vmhost in (get-vmhost)){
$esxcli = Get-EsxCli -vmhost $vmhost
$esxcli.system.coredump.network.get()}
{% endhighlight %}

![](/images/screenshot.361.jpg)

#Setting the ESXi Dump Collector Example:
{% highlight powershell %}
Foreach ($vmhost in (get-vmhost)) {
$esxcli = Get-EsxCli -vmhost $vmhost
$esxcli.system.coredump.network.set($null, “vmk0″, “IPtoDumpCollector″, “6500″)
$esxcli.system.coredump.network.set($true)}
{% endhighlight %}

![](/images/screenshot.351.jpg)

#Test Host by Causing PSOD
Run the following command via SSH or Direct Shell. We can see that the server is now doing a network coredump.

```
vsish -e set /reliability/crashMe/Panic 1
```

![](/images/screenshot.391.jpg)

#Post-Installation Changes
If you wish to change the default port or maxsize of the dump, these can be changed by modifying the vmconfig-netdump.xml file. See below link with instructions on how to make the changes and restart the Dump Collector Service.
[KB2002954](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2002954)

#PowerCLI Scripts courtesy of Mike Laverick
[http://www.mikelaverick.com/2013/12/back-to-basics-installing-other-optional-vcenter-5-5-services/](http://www.mikelaverick.com/2013/12/back-to-basics-installing-other-optional-vcenter-5-5-services/)
