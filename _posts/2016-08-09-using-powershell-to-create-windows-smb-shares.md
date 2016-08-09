---
layout: post
title: "Using Powershell to Create Windows SMB Shares"
categories:
- Windows
comments: true
---
I have been knee deep in migrations, so after clicking through a few times to create clustered file shares, I finally decided to script them. Here is that script I thought I would share. Thanksfully there was the NTFSSecurity module published by microsoft that makes permissions a breeze. You can get more details by viewing the module page.

#### ***Pre-Requsites***
- [NTFS Security Module](https://gallery.technet.microsoft.com/scriptcenter/1abd77a5-9c0b-4a2b-acef-90dbb2b84e85)

#### ***Link to Script***
- [Create-SMBShare.ps1](https://github.com/dstamen/Powershell/blob/master/Create-SMBShare.ps1)

#### ***Preparing to Execute the Script***
Fill in the appropriate variables, and execute the script.

```powershell
Import-Module NTFSSecurity

#variables
$sharename = "share"
$cachingmode = "none"
$continuouslyavailable = $true
$encryptdata = $false
$folderenumerationmode = "AccessBased"
$path = "D:\Shares\"
$scopename = "ClusterORResourceName"
$sharepath = $path+$sharename
$fullaccess = "Everyone"


#check if path exists
$PathCheck = Test-Path $sharepath
if ($PathCheck -eq $true) {
    Write-Host "$sharepath exists."
}
else {
    Write-Host "$sharepath does not exist"
    New-Item $sharepath -type directory
}


#create share
New-SmbShare -Name $sharename -CachingMode $cachingmode -ContinuouslyAvailable $continuouslyavailable -EncryptData $encryptdata -FolderEnumerationMode $folderenumerationmode -Path $sharepath -ScopeName $scopename -FullAccess $fullaccess

#disable inheritance and add full access
Disable-NTFSAccessInheritance $sharepath -RemoveInheritedAccessRules
Add-NTFSAccess $sharepath -Account BUILTIN\Administrators -AccessRights FullControl
Get-NTFSAccess $sharepath
```

#### ***Execute the Script***
- Run .\Create-SMBShare.ps1
