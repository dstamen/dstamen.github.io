---
layout: post
title: "Using UCS PowerTool to Configure Syslog Servers"
categories:
- Cisco
comments: true
---
Time for more UCS Scripting! This time to configure Syslog. The script is pretty straightforward, but nice to have to easily set up Syslog across multiple UCS domains.

#### ***Pre-Requsites***
- [UCS Powertool](https://communities.cisco.com/docs/DOC-53838)

#### ***Link to Script***
- [Set-UcsSyslog.ps1](https://github.com/dstamen/UCS-PowerTool/blob/master/Set-UCSSyslog.ps1)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

{% highlight powershell %}
# UCS PowerTool Script that to set Syslog
# @davidstamen
# http://davidstamen.com

#Define Variables
$cred = Get-Credential
$domains = "ucs01.lab.local","ucs02.lab.local"
$SyslogServer = "syslog.lab.local"
$Name = "primary"
$Facility = "local7"
$AdminState = "enabled"
$Severity = "notifications"

#Cycles through each UCS setting values
Foreach ($ucs in $domains) {
  Connect-UCS $ucs -Credential $cred
  Get-UcsSyslogClient -Name $Name | Set-UcsSyslogClient -AdminState $AdminState -ForwardingFacility $Facility -Hostname $SyslogServer -Severity $Severity -Force
  Disconnect-UCS
}
{%endhighlight%}

#### ***Execute the Script***
- Run .\Set-UcsSyslog.ps1
