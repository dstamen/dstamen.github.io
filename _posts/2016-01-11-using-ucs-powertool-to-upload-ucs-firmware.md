---
layout: post
title: "Using UCS PowerTool To Upload UCS Firmware"
categories:
- Cisco
comments: true
---
It's patch time! That means time to upload the firmware bundles to all my UCS domains. Instead of doing it manually I figured i would create a quick script to do that for me.

#### ***Pre-Requsites***
- [UCS Powertool](https://communities.cisco.com/docs/DOC-53838)

#### ***Link to Script***
- [UploadUCSFirmware.ps1](https://github.com/dstamen/UCS-PowerTool/blob/master/UploadUCSFirmware.ps1)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

{% highlight powershell %}
#Define Variables
$cred = Get-Credential
$domains = "ucs01.lab.local","ucs02.lab.local"
$fileName = "C:\Users\david\Downloads\ucs-k9-bundle-infra.2.2.6e.A.bin"

#Cycles through each UCS uploading the UCS Firmware
Foreach ($ucs in $domains) {
  Connect-UCS $ucs -Credential $cred
  Send-UcsFirmware -LiteralPath $fileName | Watch-Ucs -Property TransferState -SuccessValue downloaded -PollSec 30 -TimeoutSec 600
  Disconnect-UCS
}
{%endhighlight%}

#### ***Execute the Script***
- Run .\UploadUCSFirmware.ps1
