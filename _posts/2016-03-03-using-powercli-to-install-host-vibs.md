---
layout: post
title: "Using PowerCLI to Install Host VIBs"
categories:
- PowerCLI
comments: true
---
So currently Cisco has an issue with installing their ENIC and FNIC VIBs through Update Manager for ESXi 6.x. Until that is resolved I need to manually push out patches to these hosts. Obviously I do not want to do this manually, so I will be utilizing PowerCLI to accomplish this task.

#### ***Pre-Requsites***
- [VMware PowerCLI](https://www.vmware.com/support/developer/PowerCLI/)

#### ***Link to Script***
- [Install-HostVIB.ps1](https://github.com/dstamen/PowerCLI/blob/master/Install-HostVIB.ps1)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

*This script assumes you have already launched PowerCLI and modified the variables*

```powershell
# Define Variables
$Cluster = "Cluster"
$VIBPATH = "/vmfs/volumes/NFS01/VIB/cisco/scsi-fnic_1.6.0.24-1OEM.600.0.0.2494585.vib"
$vcenter = "vcenter.lab.local"
$cred = Get-Credential

# Connect to vCenter
Connect-VIServer -Server $vcenter -Credential $cred

# Get each host in specified cluster that meets criteria
Get-VMhost -Location $Cluster | where { $_.PowerState -eq "PoweredOn" -and $_.ConnectionState -eq "Connected" } | foreach {

    Write-host "Preparing $($_.Name) for ESXCLI" -ForegroundColor Yellow

    $ESXCLI = Get-EsxCli -VMHost $_

    # Install VIBs
    Write-host "Installing VIB on $($_.Name)" -ForegroundColor Yellow
    $action = $ESXCLI.software.vib.install($null,$null,$null,$null,$null,$true,$null,$null,$VIBPATH)

    # Verify VIB installed successfully
    if ($action.Message -eq "Operation finished successfully."){Write-host "Action Completed successfully on $($_.Name)" -ForegroundColor Green} else {Write-host $action.Message -ForegroundColor Red}
}
```

#### ***Execute the Script***
- Run .\Install-HostVIB.ps1
