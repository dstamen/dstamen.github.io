---
layout: post
title: "Configuring Unifi Controller and USG for L2TP VPN"
categories:
- Ubiquiti
comments: true
---

I have been waiting for native GUI support for L2TP vpn with local users and it is finally here! Ubiquiti Unifi Equipment now supports local radius auth using the 5.5.x code of controller! Please see below on how you can get this setup. For my example i will be using the Stable Candidate 5.5.11.

[Unifi Controller 5.5.11](https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-5-5-11-Stable-Candidate-has-been-released/ba-p/1905832)

Configuration is quite simple! Just follow these few easy steps and you will be up in no time.

-  The first step is to create your radius profile. to do this browse to *Settings* and then *Profiles*.
  - Here you will create a name for your radius profile, the only thing you will change here is the *IP Address* of your USG and then set the *Password/Pre Shared Secret*. When done hit save.

![](/images/vpnradiusprofile.png)

- Next up on the configuration is the Radius Service Configuration. Browse to *Settings* and *Services*.
  - First up is the user, select Users and then enter in the following details.
    - Name: username
    - Password: password to be used for client conenctivity
    - VLAN: leave blank
    - Tunnel Type: 3 (For L2TP)
    - Tunnel Medium Type: 1 (For IPv4)

![](/images/vpnradiususers.png)

- Next up on the Radius Service configuration is the *Server* Configuration.
  - Click on Server under Servers/Radius and *Enable Radius Server*.
    - The only thing you will do here is set the *L2TP Secret*.

![](/images/vpnradiusserver.png)

- Next up on the configuration is to browse to *Settings* and *Networks*.
  - Here you will create a new network with the following details..
    - Purpose: Remote User VPN
    - VPN Type: L2TP Server
    - Pre Shared Key: This is the *secret* you configured for the Radius Server.
    - Gateway/Subnet: IP Information for your VPN Clients
    - Other: Fill in other fields as needed.

![](/images/vpnnetworks.png)

Once everything is complete you will now have an extra bubble with VPN statistics!

![](/images/dashboardview.png)

Nothing else is needed! Once the Unifi USG provisions it automatically adds in the needed firewall rules, you can now configure your normal L2TP client to connect.
