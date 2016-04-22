---
layout: post
title: "Using PureStorage Powershell to Configure SysLog Servers"
categories:
- PureStorage
comments: true
---
Currently working on the final steps of getting our new equipment configured. The next step was to configure Syslog on all of our Pure Arrays. Another reason to script this task! Easily populate your arrays and server and at the click of a button you can configure all your arrays easily.

#### ***Pre-Requsites***
- [PureStorage Powershell SDK](http://blog.purestorage.com/announcing-the-new-pure-storage-powershell-sdk/)

#### ***Link to Script***
- [Set-PureStorageSyslog.ps1](https://github.com/dstamen/PureStorage/blob/master/Set-PureStorageSyslog.ps1)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

```powershell
#Import Module
Import-Module PureStoragePowershellSDK

#Define Variables
$cred = Get-Credential
$arrays = "pure.lab.local"
$SysLogServers = "tcp://syslog.lab.local:514"

#Cycles through each UCS setting values
Foreach ($array in $arrays) {
  Write-Host "Setting Syslog Information for $array"
  $FlashArray = New-PfaArray -EndPoint $array -Credentials $cred -IgnoreCertificateError
  Set-PfaSyslogServers -Array $FlashArray -SyslogServers $SyslogServers|fl
}
```

#### ***Execute the Script***
- Run .\Set-PureStorageSyslog.ps1
