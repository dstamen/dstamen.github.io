---
layout: post
title: "Using UCS PowerTool To Set SNMP Configuration"
categories:
- Cisco
comments: true
---
Time for more UCS Scripting! This time to enable SNMP. The script is pretty straightforward, but nice to have to easily set up SNMP across multiple UCS domains.

#### ***Pre-Requsites***
- [UCS Powertool](https://communities.cisco.com/docs/DOC-53838)

#### ***Link to Script***
- [Set-UcsSnmpConfiguration.ps1](https://github.com/dstamen/UCS-PowerTool/blob/master/Set-UcsSnmpConfiguration.ps1)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

```powershell
#Define Variables
$cred = Get-Credential
$domains = "ucs01.lab.local","ucs02.lab.local"
$Descr = "SNMP config for UCS"
$AdminState = "enabled"
$SysContact = "admin@lab.local"
$SysLocation = "US"
$Community = "public"

#Cycles through each UCS setting values
Foreach ($ucs in $domains) {
  Connect-UCS $ucs -Credential $cred
  $servers = Get-UCSRackUnit
  Foreach ($server in $servers) {
    Set-UcsSnmp -Descr $Descr -AdminState $AdminState -SysContact  $SysContact -SysLocation $SysLocation -Community $Community -force
  }
  Disconnect-UCS
}
```

#### ***Execute the Script***
- Run .\Set-UcsSnmpConfiguration.ps1
