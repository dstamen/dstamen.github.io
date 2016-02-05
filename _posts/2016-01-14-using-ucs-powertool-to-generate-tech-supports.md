---
layout: post
title: "Using UCS PowerTool To Generate Tech Supports"
categories:
- Cisco
comments: true
---
Automation, Automation, Automation! I had to download some support bundles for every chassis in our multiple zones. Instead of manually going through the GUI, I figured why not script it! This script will connect to each UCS domain and automatically generate a support bundle and download it for each chassis.

#### ***Pre-Requsites***
- [UCS Powertool](https://communities.cisco.com/docs/DOC-53838)

#### ***Link to Script***
- [Create-UCSTechSupport.ps1](https://github.com/dstamen/UCS-PowerTool/blob/master/Create-UCSTechSupport.ps1)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

{% highlight powershell %}
#Define Variables
$cred = Get-Credential
$domains = "ucs01.lab.local","ucs02.lab.local"
$fileloc = "C:\Users\david\desktop\logs\"

#Cycles through each UCS creating a tech support for each chassis.
Foreach ($ucs in $domains) {
Connect-UCS $ucs -Credential $cred
$Chassis = Get-UCSChassis
  Foreach ($chassis in $chassis) {
    $id = $chassis.id
    $filename = "$fileloc$ucs-techsupp-chassis-$id.tar"
    Get-UcsTechSupport -PathPattern $filename -RemoveFromUcs -TimeoutSec 600 -ChassisId $id -CIMC 'all'
  }
Disconnect-UCS
}

{%endhighlight%}

#### ***Execute the Script***
- Run .\Create-UCSTechSupport.ps1
