---
layout: post
title: "Using PowerCLI to Replicate Templates to Multiple Clusters"
categories:
- PowerCLI
comments: true
---
We have multiple clusters within our vCenters that are defined as a rack. Each rack has its own storage, so storage is not shared between clusters. I needed to develop a way to easily replicate templates between clusters, so a local copy existed on each cluster to take advantage of VAAI.

I really wanted to utilize the vSphere Content Libary for these, but there is currently no publicly available documentation on how to deploy a VM from a Content Library via a Script. I am hoping when that is available, I will update this post.

####***Pre-Requsites***
- [VMware PowerCLI](https://www.vmware.com/support/developer/PowerCLI/)

####***Link to Script***
- [CloneTemplateToClusters.ps1](https://github.com/dstamen/PowerCLI/blob/master/CloneTemplateToClusters.ps1)

####***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

*This script assumes the datastore you would like to deploy to is a datastore cluster. Mine are named cluster-dsc so this script was easily scaleable.*

{% highlight powershell %}
#Import PowerCLI Module
Add-PSSnapin VMware.VimAutomation.Core

#Define Variables
$Credential = Get-Credential
$vCenter = "vcenter.lab.local"
$clusters = "Cluster01","Cluster02"
$location = "Templates"
$templates = "Template1","Template2"

#Connect to vCenter
Connect-VIServer $vCenter -Credential $Credential

foreach ($template in $templates){
  foreach ($cluster in $clusters){
    #Check if Template exists
    Try{Get-Template $template-$cluster -ErrorAction Stop;$TemplateExists = $true}Catch {$TemplateExists = $false}
    #Create VM
    If($TemplateExists -eq $true){
        #Remove Old Template
        Get-Template -Name $template-$cluster |Remove-Template -DeletePermanently -Confirm:$false
        #Clone the Template
        New-VM -Name $template-$cluster -Template $template -ResourcePool $cluster -Datastore $cluster-DSC -Location $location
        #Convert to Template
        Set-VM -VM $template-$cluster -ToTemplate -Confirm:$false
    }
    ElseIf($TemplateExists -eq $false){
        #Clone the Template
        New-VM -Name $template-$cluster -Template $template -ResourcePool $cluster -Datastore $cluster-DSC -Location $location
        #Convert to Template
        Set-VM -VM $template-$cluster -ToTemplate -Confirm:$false
    }
  }
}
#Disconnect from vCenter
Disconnect-VIServer $vCenter -Force -Confirm:$false
{%endhighlight%}

####***Execute the Script***
- Run .\CloneTemplateToClusters.ps1
