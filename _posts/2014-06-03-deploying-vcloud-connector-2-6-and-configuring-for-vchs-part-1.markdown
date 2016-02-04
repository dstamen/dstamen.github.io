---
layout: post
title: Deploying vCloud Connector 2.6 and Configuring For vCHS (Part 1)
categories:
- vCloud Air
comments: true
---
So luckily i was selected for the June 2014 wave of vCloud Hybrid Service  access as a vExpert. I have been looking forwarding to using vCHS since it went GA and am glad to finally have the opportunity to use it hands on.

Once I got access I knew I wanted to copy some of my existing workloads to vCHS instead of having to start from scratch. I begin to look for some good guides on implementing vCloud Connector 2.6 but couldn't find anything as it was just released and majorly overhauled.

So here is my first howto blog post, I hope it helps you get your POC configured nice and smooth.

First you will need to download the vCloud Connector Server and vCloud Connector Node from https://my.vmware.com. vCloud Connector 2.6 is now free and no longer needs a license.

Once you have the two OVF bundles downloaded you will need to deploy them through vCenter.

1. Select File, Deploy OVF.
![](/images/screenshot.7.jpg)
2. Now browse and select the vCloud Connector Server OVF File
![](/images/screenshot.8.jpg)
3. Next you will be prompted with the OVF Information and requirements, select Next.
![](/images/screenshot.9.jpg)
4. Accept the EULA.
![](/images/screenshot.10.jpg)
5. Leave Default VM Name
![](/images/screenshot.11.jpg)
6. Choose the host/cluster you wish to deploy to.
![](/images/screenshot.121.jpg)
7. Choose a resource pool (if utilized)
![](/images/screenshot.13.jpg)
8. Choose your datastore.
![](/images/screenshot.14.jpg)
9. Choose your Disk Format, in most cases you may want to use Thin.
![](/images/screenshot.15.jpg)
10. Select your network port group.
![](/images/screenshot.16.jpg)
11. Fill in Static IP information, if you want to use DHCP leave all fields blank.
![](/images/screenshot.17.jpg)
12. Review your settings and then hit Finish to deploy your vCloud Connector Server.

Repeat all steps above for your vCloud Connector Node. This will be utilized to add your Private Cloud (vCenter) to vCloud Connector to move virtual machines to vCHS.

[Deploying vCloud Connector 2.6 and Configuring For vCHS (Part 2)](http://davidstamen.com/2014/06/03/deploying-vcloud-connector-2-6-and-configuring-for-vchs-part-2/)
