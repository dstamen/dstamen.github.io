---
layout: post
title: "Configuring Multiple UCS VLAN's"
categories:
- Cisco
comments: true
---
We are currently working on some Cisco ACI Integration and wanted to add a large VLAN Pool to a UCS Configuration.

Since currently Cisco UCS does not allow selecting multiple VLAN's easily when adding to a VLAN Group or vNIC Template, we now have a pretty decent script that will do it for you.

The script can be found [here.](https://github.com/dstamen/UCS-PowerTool/blob/master/ConfigureVLANGroupAndvNICTemplate.ps1)

{% highlight powershell %}
# PowerCLI Script for adding VLAN to VLAN Group and vNIC Template
# @davidstamen
# http://davidstamen.com

#Define Variables
$cred = Get-Credential
$ucs = "ucs01"
$startvlan = "100"
$endvlan = "150"
$vnictemplate = "vnic-template"
$vlangroup = "vlan-group"

#Connect to UCS
Connect-UCS $ucs -credential $cred

#Assumes VLAN Name is the VLANID. Adds VLAN from start to end to vlan group
for($i=$startvlan;$i -le $endvlan;$i++){Get-UcsFabricNetGroup -Name $vlangroup |Add-UcsFabricPooledVlan -Name "$i"}

#Assumes VLAN Name is the VLANID. Adds VLAN from start to end to vnic template
for($i=$startvlan;$i -le $endvlan;$i++){Get-UcsVnicTemplate -Name $vnictemplate | Add-UcsVnicInterface -ModifyPresent -DefaultNet false -Name "$i"}
Disconnect-UCS
{%endhighlight%}

You now are done! In my case I had to add 500 VLAN's, so this script saved me quite a bit of time.
