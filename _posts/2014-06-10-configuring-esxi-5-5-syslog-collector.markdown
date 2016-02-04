---
layout: post
title: Configuring ESXi 5.5 Syslog Collector
categories:
- PowerCLI
comments: true
---
Thank you to everyone who listened to me on the EMEA vBrownbag. Here are copies of documentation and scripts on how to configure ESXi to use the Syslog collector.

#Check the ESXi Syslog Collector Configuration Example:
{% highlight powershell %}
Foreach ($vmhost in (get-vmhost)){
$esxcli = Get-EsxCli -vmhost $vmhost
$esxcli.system.syslog.config.get()}
{% endhighlight %}

![](/images/screenshot.371.jpg)

#Setting the ESXi Syslog Collector Example:
{% highlight powershell %}
Foreach ($vmhost in (get-vmhost)){
$esxcli = Get-EsxCli -vmhost $vmhost
$esxcli.system.syslog.config.set($null, $null, $null, $null,"udp://IPtoSyslogServer:514″)
$esxcli.system.syslog.reload()}
{% endhighlight %}

![](/images/screenshot.381.jpg)

#Post-Installation Changes
If you wish to change the default port or maxsize of the syslog rotation, these can be changed by modifying the vmconfig-syslog.xml file. See below link with instructions on how to make the changes and restart the Syslog Collector Service.
[2021652](/images/http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2021652)

#PowerCLI Scripts courtesy of Mike Laverick
[http://www.mikelaverick.com/2013/12/back-to-basics-installing-other-optional-vcenter-5-5-services/](http://www.mikelaverick.com/2013/12/back-to-basics-installing-other-optional-vcenter-5-5-services/)
