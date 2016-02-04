---
layout: post
title: "Unregistering vSphere 6 VCSA from PSC"
categories:
- VMware
comments: true
---
So I am in the process of doing some vSphere 6 testing and needed to test a redeployment of one of my VCSA's. The problem is when I went to redeploy it I got the following error.

![](/images/unregistervcsaerror.png)

Decoding the error, I pretty much figured that the object already existed in the SSO database and I needed to delete the existing object. Here is how you do that.

- Log in as root to the appliance shell of the Platform Services Controller appliance with which the vCenter Server Appliance is registered.
- To enable the Bash shell, run the shell.set --enabled true command.
  - Run the shell command to start the Bash shell and log in.
- Run the cmsso-util unregister command to unregister the powered off vCenter Server Appliance.
  - cmsso-util unregister --node-pnid vCenter-FQDNorIP --username administrator@your_domain_name --passwd vCenter-Single-Sign-On-password

![](/images/unregistervcsa.png)

***The object is now deleted and you can redeploy your VCSA!***
