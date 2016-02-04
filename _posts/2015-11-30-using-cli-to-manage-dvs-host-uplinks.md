---
layout: post
title: "Using CLI to Manage DVS Host Uplinks"
categories:
- VMware
comments: true
---
Ever needed to modify a DVS uplink configuration from ESXi Shell? I am currently troubleshooting some issues with DVS uplinks no longer being assigned on reboot.

***As a heads up. If you are doing this on ESXi 6.0.. don't. It can cause an issue with the proxy DVS having different ID than the actual DVS causing my original issue, still working with VMware Support to find out more details.***

After "Restoring Network Configuration" a few too many times, I finally realized I could just add the uplinks back via CLI until support can figure out why this is occurring, here are the details on how to manage the uplinks on a DVS via CLI.

To view your current dvs configuration you can run **esxcfg-vswitch -l**. Here you can see the DVS Name, Uplinks and DVPort ID which is all information you need to move forward.

{% highlight bash %}
DVS Name         Num Ports   Used Ports  Configured Ports  MTU     Uplinks
dvSwitch         256         3           256               1500    vmnic0,vmnic1

  DVPort ID           In Use      Client
  0                   1           vmnic0
  1                   1           vmnic1
{%endhighlight%}

To **REMOVE** an Uplink you can use these steps. Where -Q is to remove the vmnic, -V is the DVPort ID and dvSwitch is the name of the DVS.

{% highlight bash %}
esxcfg-vswitch -Q vmnic1 -V 1 dvSwitch
{%endhighlight%}

To **ADD** an Uplink you can use these steps. Where -P is to add the vmnic, -V is the DVPort ID and dvSwitch is the name of the DVS.

{% highlight bash %}
esxcfg-vswitch -P vmnic1 -V 1 dvSwitch
{%endhighlight%}
