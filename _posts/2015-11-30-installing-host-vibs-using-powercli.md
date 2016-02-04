---
layout: post
title: "Installing Host VIB's Using PowerCLI"
categories:
- PowerCLI
comments: true
---
Normally when i need to install and update a host VIB I use Update Manager. However there is currently a [bug](https://tools.cisco.com/bugsearch/bug/CSCuw47512/) with Cisco's latest enic/fnic drivers that wont let you install them via UM.

I had to run these updates on over 50 hosts and I really didn't want to have to ssh and install it manually. Lucky I remember [Brian Graf's Host Client Install Fling](http://www.vtagion.com/automate-install-embedded-host-client-esxi-fling-hosts-cluster/) and borrowed some of the code to come up with the below script.

All you need to do is input your cluster and specify what VIB's you want to install. You can see the VIBPath and the Actions and just add or delete them as needed for the VIB's you want to install.

{% highlight powershell %}
# Define Variables
$Cluster = "Cluster"
$VIBPATH1 = "/vmfs/volumes/NFS01/VIB/cisco/net-enic-2.1.2.71-1OEM.550.0.0.1331820.x86_64.vib"
$VIBPATH2 = "/vmfs/volumes/NFS01/VIB/cisco/scsi-fnic-1.6.0.17a-1OEM.550.0.0.1331820.x86_64.vib"


# Get each host in specified cluster that meets criteria
Get-VMhost -Location $Cluster | where { $_.PowerState -eq "PoweredOn" -and $_.ConnectionState -eq "Connected" } | foreach {

    Write-host "Preparing $($_.Name) for ESXCLI" -ForegroundColor Yellow

    $ESXCLI = Get-EsxCli -VMHost $_

    # Install VIBs
    Write-host "Installing VIB on $($_.Name)" -ForegroundColor Yellow
    $action = $ESXCLI.software.vib.install($null,$null,$null,$null,$null,$true,$null,$null,$VIBPATH1)
    $action2 = $ESXCLI.software.vib.install($null,$null,$null,$null,$null,$true,$null,$null,$VIBPATH2)

    # Verify VIB installed successfully
    if ($action.Message -eq "Operation finished successfully."){Write-host "Action Completed successfully on $($_.Name)" -ForegroundColor Green} else {Write-host $action.Message -ForegroundColor Red}
    if ($action2.Message -eq "Operation finished successfully."){Write-host "Action Completed successfully on $($_.Name)" -ForegroundColor Green} else {Write-host $action.Message -ForegroundColor Red}
}
{%endhighlight%}

Hope this helps anyone else out wanting to automate vib installation using PowerCLI.
