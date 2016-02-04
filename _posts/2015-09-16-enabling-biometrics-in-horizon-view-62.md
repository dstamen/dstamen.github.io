---
layout: post
title: "Enabling Biometrics in Horizon View 6.2"
categories:
- Horizon View
comments: true
---
Horizon 6.2 Introduced Biometric Authentication, with initial support for TouchID on IOS devices.

This post will explain how to enable it, as its not really something greatly documented right now. I think they are aware and hopefully in a future update this will be easier.

[Here](https://pubs.vmware.com/horizon-62-view/index.jsp#com.vmware.horizon-view.administration.doc/GUID-02404EBB-0578-4046-93A6-D57CABA1A8F9.html?resultof=%2522%2562%2569%256f%256d%2565%2574%2572%2569%2563%2522%2520%2522%2562%2569%256f%256d%2565%2574%2572%2522%2520) is a link to the current VMware documentation.

**NOTE:** This feature does require a 3rd party trusted signed certificate to work. From my current testing and speaking with others self-signed certificates will not function.

- Log on to your connection server and launch ADSI Edit.
- In the Connection Settings dialog box, select or connect to DC=vdi,DC=vmware,DC=int.
- In the Computer pane, select or type localhost:389 or the fully qualified domain name (FQDN) of the View Connection Server host followed by port 389.
  - For example: localhost:389 or mycomputer.mydomain.com:389

![](/images/biometric1.png)

- On the object CN=Common, OU=Global, OU=Properties, edit the pae-ClientConfig attribute and add the value BioMetricsTimeout=-1.

![](/images/biometric2.png)

- The new setting takes effect immediately. You do not need to restart the View Connection Server service or the client device.
