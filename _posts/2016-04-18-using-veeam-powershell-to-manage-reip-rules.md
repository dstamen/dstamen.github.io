---
layout: post
title: "Using Veeam Powershell to Manage ReIP Rules"
categories:
- Veeam
comments: true
---
Hello! Welcome to my First Veeam PowerShell Script! I have been working on tons of migrations using Veeam Backup and Replication and need to create re-ip rules to update the static IP assignments. Obviously the first rule of scripting if you do something more than once, automate! I was bad at this one, I originally tried and gave up so I did about 20 manually which started to become a huge headache.

Thanks to  Marcus Puckett (@mpuckett259) he helped me on the side figure out the syntax to get the rule to append and not overwrite. See below for the script. Check out the Github for the bits!

#### ***Pre-Requsites***
- [Veeam Powershell](https://helpcenter.veeam.com/backup/powershell/getting_started.html)

#### ***Link to Script***
- [Create-VeeamReIPRule.ps1](https://github.com/dstamen/Veeam/blob/master/Create-VeeamReIPRule.ps1)
- [ReIPRule-Template.csv](https://github.com/dstamen/Veeam/blob/master/ReIPRule-Template.csv)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just update the CSV file and then you execute the script.

{% highlight powershell %}
#Define Variables
param
(
    [Parameter(Mandatory=$False,
        HelpMessage='Path to CSV to Import')]
        [string[]]$csvlist
)

#Load Veeam Plugin
Add-PSSnapin -Name VeeamPSSnapIn -ErrorAction SilentlyContinue

#Check if CSV was specified, if not prompt.
If($csvlist -eq $NULL){
    $csvlist = Read-host -Prompt "Csv to import"
}
If((Test-Path $csvlist) -eq $False){Write-host "Could not find CSV.";break}

#Import CSV
$iplist = Import-csv "$csvlist"

#Cycle through each row and add in the ReIP Rule
Foreach ($item in $iplist) {
  $Description = $item.Description
  $Job = $item.Job
  $SourceIp = $item.SourceIp
  $SourceMask = $item.SourceMask
  $TargetIp = $item.TargetIp
  $TargetMask = $item.TargetMask
  $TargetGateway = $item.TargetGateway
  $DNS1 = $item.DNS1
  $DNS2 = $item.DNS2

  $currentiprules = Get-VBRJob -Name $Job | Get-VBRViReplicaReIpRule
  $newiprule = New-VBRViReplicaReIpRule -SourceIp $SourceIp -SourceMask $SourceMask -TargetIp $TargetIp -TargetMask $TargetMask -TargetGateway $TargetGateway -DNS $DNS1,$DNS2 -Description $Description
  $newrules = @($currentiprules) + @($newiprule)
  $replicajob = Get-VBRJob -Name $Job
  Set-VBRViReplicaJob -Job $replicajob -EnableReIp -ReIpRule $newrules

}

{%endhighlight%}

#### ***Execute the Script***
- Run .\Create-VeeamReIPRule.ps1 pathtocsv
