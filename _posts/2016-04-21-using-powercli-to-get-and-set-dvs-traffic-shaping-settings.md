---
layout: post
title: "Using PowerCLI to Get and Set DVS Traffic Shaping Settings"
categories:
- PowerCLI
comments: true
---
I have been in process in configuring traffic shaping for multiple port groups. It seems with PowerCLI 6.3 R1 there are no native Powershell Cmdlets. Luckily I stumbled across [@Lucd](http://www.lucd.info/2011/06/11/dvswitch-scripting-part-9-traffic-shaping/) and his PowerCLI functions to manage these settings, i have put these into a script to mass get and set the settings for all port groups of a DVS's.

#### ***Pre-Requsites***
- [VMware PowerCLI](https://www.vmware.com/support/developer/PowerCLI/)

#### ***Link to Script***
- [Get-VMwareTrafficShapingSettings.ps1](https://github.com/dstamen/PowerCLI/blob/master/Get-VMwareTrafficShapingSettings.ps1)
- [Set-VMwareTrafficShapingSettings.ps1](https://github.com/dstamen/PowerCLI/blob/master/Set-VMwareTrafficShapingSettings.ps1)

#### ***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

*This script assumes you have already launched PowerCLI and modified the variables*

#### ***Get Traffic Shaping Settings***
{% highlight powershell %}

Foreach ($VirtualSwitch in Get-VirtualSwitch -Distributed)  {
  Foreach ($VirtualPortGroup in Get-VirtualPortGroup -VirtualSwitch $VirtualSwitch|Where {$_.Name -notlike "*DVUplinks*"}) {
      Write "$VirtualPortGroup on $VirtualSwitch"
      $dvPg = Get-dvSwPg -dvSw $VirtualSwitch.ExtensionData -PGName $VirtualPortGroup
      Get-dvPgTrafficShaping -dvPg $dvPg|ft
  }
}
{%endhighlight%}


#### ***Set Traffic Shaping Settings***
{% highlight powershell %}

Foreach ($VirtualSwitch in Get-VirtualSwitch -Distributed)  {
  Foreach ($VirtualPortGroup in Get-VirtualPortGroup -VirtualSwitch $VirtualSwitch|Where {$_.Name -notlike "*DVUplinks*"}) {
      Write "$VirtualPortGroup on $VirtualSwitch"
      $dvPg = Get-dvSwPg -dvSw $VirtualSwitch.ExtensionData -PGName $VirtualPortGroup
      Set-dvPgTrafficShaping -dvPg $dvPg -InShaping -inAverageKbps 10485760 -inBurstKB 102400 -inPeakKbps 10485760 -OutShaping -outAverageKbps 10485760 -outBurstKB 102400 -outPeakKbps 10485760
   }
}
{%endhighlight%}


#### ***Execute the Script***
- Run .\Get-VMwareTrafficShapingSettings.ps1
- Run .\Set-VMwareTrafficShapingSettings.ps1

#### ***Screenshots***
![](/images/trafficshaping1.png)
