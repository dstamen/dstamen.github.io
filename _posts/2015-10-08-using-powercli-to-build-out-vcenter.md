---
layout: post
title: "Using PowerCLI to Build Out vCenter"
categories:
- PowerCLI
comments: true
---
I wanted to share this handy script i created when you have a need to build out a new vCenter.

This script can be extremely handy as it will take care of creating the datacenter, cluster, adding hosts, creating datastores and then applying the appropriate host profile. It is all done via CSV files so it is extremely customizable.

### Files to modify to customize your configuration
- ***createdatacenter.csv*** - Contains the name of the datacenter to create.
- ***createcluster.csv*** - Contains the name of the cluster to create and the datacenter to put it in.
- ***createhosts.csv*** - Contains the Name of the host and which cluster to place them in.
- ***createdatastores.csv*** - Contains the name of the datastore, naaid of the lun and the datastore cluster to put it in.
- ***applyhostprofile.csv*** - Contains the name of the host and hostprofile to apply.

The code and Github Link can be found below.

[ConfigvCenter.ps1](https://github.com/dstamen/PowerCLI/tree/master/ConfigvCenter)
{% highlight powershell %}
# Variables
$vcenter = "vc.lab.local"
$esxusername = "root"
$esxpassword = "password"
$DSC = "DSC01"
$Datacenter = "Lab"

#Connect to vCenter
#Connect-VIServer -Server $vCenter

# Create Datacenters
Write-Host "Creating Datacenter" -ForegroundColor "Green"
$csv = Import-CSV .\createdatacenter.csv
foreach ($datacenter in $csv) {
  New-Datacenter -Location (Get-Folder -NoRecursion) -Name $datacenter.Name
}

# Create Clusters
Write-Host "Creating Clusters" -ForegroundColor "Green"
$csv = Import-CSV .\createcluster.csv
foreach ($cluster in $csv) {
  New-Cluster -Name $cluster.Name -Location $cluster.Datacenter -DRSEnabled -DrsAutomationLevel FullyAutomated -HAEnabled
}

# Create Clusters
Write-Host "Adding Hosts" -ForegroundColor "Green"
$csv = Import-CSV .\createhosts.csv
foreach ($vmhost in $csv) {
  Add-VMHost -Name $vmhost.Name -Location $vmhost.Cluster -User $esxusername -Password $esxpassword
  Set-VMHost -VMHost $vmhost.Name -State Maintenance
}

# Create Datastores
Write-Host "Creating Datastores" -ForegroundColor "Green"
$csv = Import-CSV .\createdatastores.csv
foreach ($datastore in $csv) {
  New-Datastore -VMHost $datastore.host -Name $datastore.Name -Path $datastore.NAAID -VMFS
}

# Create Datastore Cluster and Move Datastores In
Write-Host "Creating Datastore Cluster and Adding Datastores" -ForegroundColor "Green"
$csv = Import-CSV .\createdatastores.csv
New-DatastoreCluster -Name $DSC -Location $Datacenter
foreach ($datastore in $csv) {
  Move-Datastore $datastore.Name -Destination $datastore.DatastoreCluster
}

# Apply HostProfile
Write-Host "Applying HostProfiles" -ForegroundColor "Green"
$csv = Import-CSV .\applyhostprofile.csv
foreach ($hostprofile in $csv) {
  Apply-VMHostProfile -Entity $hostprofile.Entity -Profile $hostprofile.Profile -Confirm:$false
}

Write-Host "Complete!" -ForegroundColor "Green"
{% endhighlight %}
