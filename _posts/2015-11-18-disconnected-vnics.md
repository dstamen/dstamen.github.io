---
layout: post
title: "Disconnected vNIC's?"
categories:
- VMware
comments: true
---
Ever wonder why a VM isn't on the network?

I was working on deploying some test VM's and for some reason all the VM's that were cloned decided to start with the network disconnected, and the connect on power on was also not selected.

I decided to throw together this quick one-liner that will make sure every VM is set to start connected on power on and is currently connected.

{% highlight powershell %}
Get-VM|Get-NetworkAdapter|Set-NetworkAdapter -StartConnected $true -Connected $true -Confirm:$false
{%endhighlight%}

Voila! You are done.
