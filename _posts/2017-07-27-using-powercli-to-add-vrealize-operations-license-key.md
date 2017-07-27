---
layout: post
title: "Using PowerCLI to Add vRealize Operations License Key"
categories:
- vRealize Operations
comments: true
---
I have been working on doing a vCenter Consolidation Project. This included migrating our systems to a new vRealize Operations Server. This particular one included 73 different vSOM keys, and as you may know there is currently no way to enter in multiple keys at a time. I reached out to Kyle Ruddy and he informed me there is an API to do this, and that started my adventure to get this working.


#### ***Pre-Requsites***
- [VMware PowerCLI](https://www.vmware.com/support/developer/PowerCLI/)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, you can either export the license keys from an old vRealize Operations Server (6.6+) or create a CSV with column (LicenseKey) to be imported.

If you are choosing to export keys from an existing server, it has to be on a version that currently has API support. (I used v6.6)

You can run the following script to export all keys to a csv file.

```
$Cred = Get-Credential
$vrom = "vromold.lab.local"

Connect-OMServer -Server $vrom -Credential $Cred

$omServer = $global:DefaultOMServers[0].ExtensionData
$omLicense = $OmServer.GetLicenseKeysForProduct()
$omLicense.Solutionlicense|Export-Csv C:\temp\omkeys2.csv -NoTypeInformation
```
If you exported the keys above, you should be immediately ready to import the keys to your new vRealize Operations Server, if not you can manually create the csv as listed above.

```
$Cred = Get-Credential
$vrom = "vromnew.lab.local"

Connect-OMServer -Server $vrom -Credential $Cred

$keys = import-csv c:\temp\omkeys.csv
foreach ($key in $keys) {
    $solutionLicense = New-Object VMware.VimAutomation.VROps.Views.SolutionLicense
    $solutionLicense.LicenseKey = $key.LicenseKey
    $solutionLicenses = New-Object VMware.VimAutomation.VROps.Views.SolutionLicenses
    $solutionLicenses.Solutionlicense = $solutionLicense
    $omserver.AddLicenseKeyToProduct($solutionLicenses)
}
```

The documentation was pretty spotty on this as it stated you only needed to pass the key to AddLicenseKeyToProduct(), but after multiple tests I realized that was not true. I eventually found out i have to create SolutionLicense objects and link them till i got the proper format. This was quite fun as i learned alot about PowerShell and API documentation in this process.

You can find API documentation for vRealize Operations at https://fqdn/suite-api/docs/rest/index.html

![](/images/vrom1.png)

Hope this helps you out, leave any feedback or questions below.
