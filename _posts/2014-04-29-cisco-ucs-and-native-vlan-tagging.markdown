---
layout: post
title: Cisco UCS and Native VLAN Tagging
categories:
- Cisco
comments: true
---
Building out some new servers today I came across an issue where the servers would have no network connectivity even though the vNICs were properly tagged and assign a VLAN ID. Upon further research, I noticed that "Native VLAN" was not selected. This is a must for any operating system that does not do VLAN Tagging such as ESXi.

So remember to set the VLAN to Native if using an operating system that does not support VLAN tagging!
