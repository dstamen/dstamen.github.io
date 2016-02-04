---
layout: post
title: "Upgrading Horizon View 6.1 to 6.2"
categories:
- Horizon View
comments: true
---
I had the opportunity to upgrade my Horizon View environment from 6.1 to 6.2. As always VMware has made this very easy!

First download the bits from [here.](https://my.vmware.com/group/vmware/info/slug/desktop_end_user_computing/vmware_horizon_6/6_2)

The upgrade documentation can also be found [here.](https://pubs.vmware.com/horizon-62-view/topic/com.vmware.ICbase/PDF/view-62-upgrades.pdf)

**Warning:** In my environment I do not have a composer server, if you had one this would be upgraded first
The upgrade order is as follows. Composer Server, Connection Servers and then Security Servers.

- Log on to your connection server and launch the executable.  

![](/images/viewcs1.png)

- Accept the End User License Agreement

![](/images/viewcs2.png)

- Click Install to Upgrade.

![](/images/viewcs3.png)

- Click Finish. Repeat Process for the rest of your connection servers.

![](/images/viewcs4.png)

- Log on to your security server and launch the executable. If using IPSEC log on to View Administrator and "Prepare the Security Server for Upgrade or Reinstallation"  

![](/images/viewss1.png)

- Accept the End User License Agreement

![](/images/viewss2.png)

- This screen should show the paired connection server. Click Next.

![](/images/viewss3.png)

- Logon to the paired connection server, and generate a server pairing password.

![](/images/viewss4.png)

- Enter in the password.

![](/images/viewss5.png)

- If you are not using IPSEC you will get the following warning. Click OK.

![](/images/viewss6.png)

- Verify the URL's are correct, it should inherit these settings.

![](/images/viewss7.png)

- Allow the setup to automatically configure the windows firewall.

![](/images/viewss8.png)

- Hit Finish and Enjoy!

![](/images/viewss9.png)

Im glad VMware has continued to make this process simple. I am looking forward to the features and ease of use with the new Horizon Access Point's as well.
