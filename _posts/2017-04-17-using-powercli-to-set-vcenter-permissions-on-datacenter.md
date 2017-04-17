---
layout: post
title: "Using PowerCLI to Set vCenter Permissions on Datacenter"
categories:
- PowerCLI
comments: true
---
I have been working on doing a vCenter Consolidation Project. This has meant recreating multiple permissions groups. I couldnt find an easy way to apply permissions at a datacenter so I updated this script to be used.

#### ***Pre-Requsites***
- [VMware PowerCLI](https://www.vmware.com/support/developer/PowerCLI/)

#### ***Link to Script***
- [Set-vCenterPermissions.ps1](https://github.com/dstamen/PowerCLI/blob/master/Set-vCenterPermissions.ps1)
- [permissions.csv](https://github.com/dstamen/PowerCLI/blob/master/permissions.csv)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just need to update columns in the CSV such as Datacenter, Group and Role.

*This script assumes you have already launched PowerCLI and modified the csv*

```
# PowerCLI Script for setting vCenter Permissions base don AD Group and Datacenter
# @davidstamen
# http://davidstamen.com

param
(
    [Parameter(Mandatory=$False,
        HelpMessage='Path to CSV to Import')]
        [string[]]$permissionlist
)

#Import PowerCLI Module
Get-Module -ListAvailable VMware* | Import-Module

#Prompt for vCenter to Set Permissions
$vCenter = Read-Host -Prompt "Name or IP address of vcenter"

#Makes sure CSV was passed as parameter, if not it prompts and checks path.
If($permissionlist -eq $NULL){
    $permissionlist = Read-host -Prompt "Csv to import"
}
If((Test-Path $permissionlist) -eq $False){Write-host "Could not find CSV.";break}

#tries to connect to vcenter and breaks script if it fails.
Try{Connect-viserver $vCenter -ErrorAction "Stop"|Out-Null}
Catch {Write-Warning "Unable to Logon to $vCenter. Exiting...";break}

#define variables and loop through each entry setting permissions
$permission = Import-csv "$permissionlist"
foreach ($item in $permission) {
  $datacenter=$item.datacenter
  $role=$item.role
  $group=$item.group
  $domain=$item.domain

  Write-host "Setting $group permissions to $role on $vCenter" -ForegroundColor Green
  $Permission=New-VIPermission -Entity (Get-Datacenter $datacenter) -Principal (Get-VIAccount -Domain $domain -Group|Where-Object {$_.Name -like "*$group*"}) -Role (Get-VIRole $role) -Propagate:$true|Out-Null
}
```

#### ***Execute the Script***
- Run .\Set-vCenterPermissions.ps1 .\permissions.csv
