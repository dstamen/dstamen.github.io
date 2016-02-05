---
layout: post
title: "Using UCS PowerTool To Set Equipment Labels"
categories:
- Cisco
comments: true
---
For conformity, we like to set the UCS Equipment labels to match the Service Profile Name. This allows us to match it quickly without having to dig down into the assigned profile. This script will set the UsrLbl and Name fields on the equipment tab to match the name of the Service Profile.

#### ***Pre-Requsites***
- [UCS Powertool](https://communities.cisco.com/docs/DOC-53838)

#### ***Link to Script***
- [Set-UCSEquipmentLabel.ps1](https://github.com/dstamen/UCS-PowerTool/blob/master/Set-UCSEquipmentLabel.ps1)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

*This script is currently setup to be applied to Rack Units. To have this work for blades, change the Get-UCSRackUnit and Set-UCSRackunit to be Get-UCSBlade and Set-UCSBlade.*

{% highlight powershell %}
#Define Variables
$cred = Get-Credential
$domains = "ucs01.lab.local","ucs02.lab.local"

#Cycles through each UCS setting values
Foreach ($ucs in $domains) {
  Connect-UCS $ucs -Credential $cred
  $servers = Get-UCSRackUnit
  Foreach ($server in $servers) {
    Get-UCSRackUnit -id $server.id | Set-UCSRackunit -UsrLbl $server.assignedtodn.substring(12) -Name $server.assignedtodn.substring(12) -force
  }
  Disconnect-UCS
}
{%endhighlight%}

#### ***Execute the Script***
- Run .\Set-UCSEquipmentLabel.ps1
