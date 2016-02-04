---
layout: post
title: HTML Based Published Apps with Horizon View 6.1.1
categories:
- Horizon View
comments: true
---
So Horizon View 6.1.1 was released recently with added support for published applications to finally be accessible via the HTML client. The process is pretty straightforward, however I came across one hiccup I wanted to share.

I am assuming you have already upgraded your View Composer, Connection and Security Servers and are now focused on getting the agents up to date.

1. Install/Update Agents on virtual desktops to 6.1.1 <strong>(The HTML Access 3.4 client will not work with previous agent versions)
2. Install/Update Agents on RDS servers to 6.1.1
3. Install the HTML Access 3.4 to all your connection servers within the appropriate enviroment if load balanced
4. Now you can logon to your HTML Client and look for your published apps....however you will see that they are missing....looking into the actual guide for the html access there is an additional step.
- [HTML Access Guide](https://www.vmware.com/pdf/horizon-view/horizon-html-access-3x-document.pdf)
5. Log on to a connection server running 6.1.1 (If you are in a mixed enviroment this change cannot be made on a previous version.
6. Navigate to Farms and then edit each RDS farm to enable HTML Access.
![](/images/Screen-Shot-2015-06-10-at-10.53.53-AM.png#center)
7. Voila you now have access to all your applications via the HTML client with a fancy new interface!
![](/images/Screen-Shot-2015-06-10-at-10.43.23-AM-1024x362.png#center)
