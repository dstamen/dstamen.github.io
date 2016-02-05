---
layout: post
title: "Using UCS PowerTool To Configure UCS Policy Backup and Export"
categories:
- Cisco
comments: true
---
Im finally getting to dive back in to working with UCS. My latest task with my project of configuring 9 UCS Domains, was configuring the Policy Backup and Export. See below on how to automate this process!

#### ***Pre-Requsites***
- [UCS Powertool](https://communities.cisco.com/docs/DOC-53838)

#### ***Link to Script***
- [Set-UCSPolicyBackupandExport.ps1](https://github.com/dstamen/UCS-PowerTool/blob/master/Set-UCSPolicyBackupandExport.ps1)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

{% highlight powershell %}
#Define Variables
$UCS = "FQDNofUCS" #FQDN of UCS To COnnect To
$Hostname = "ucs.lab.local" #Hostname to Upload backup to.
$Protocol = "scp" #Transfer Protocol. ftp,scp,tftp,sftp
$User = "ftpuser" #Username
$Password = "ftpuser" #Password
$MgmtBackupRemoteFile = "Full" #Location/Prefix of File. Location/Prefix will be in front of filename
$ConfigBackupRemoteFile = "AllConfig" #Location/Prefix of File. Location/Prefix will be in front of filename
$AdminState = "enable" #enable or disable
$Schedule = "1day" #1day, 7day, 14day for daily, weekly or biweekly backups
{%endhighlight%}

#### ***Execute the Script***
- Run .\Set-UCSPolicyBackupandExport.ps1
- Logon and UCSM, Navigate to Admin/All and Then select the Policy Backup & Export.
  - Verify Settings.

![](/images/ucspolicybackup.png)

#### ***Hope this helps anyone else out wanted to automate policy backup & export on Cisco UCS.***
