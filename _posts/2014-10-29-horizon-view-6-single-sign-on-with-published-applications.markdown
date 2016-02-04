---
layout: post
title: Horizon View 6 - Single Sign On with Published Applications
categories:
- Horizon View
comments: true
---
So I have been working in a few situations where i have wanted to use Horizon 6 published (RDS) applications but having to either launch the Horizon View client within a VDI or have users be forced to logon again has been a deal breaker.

Upon further research i finally found the right combination of settings to allow users to launch the RDS Hosted Applications via a Shortcut and automatically login to the view client making this process seamless.

For some reason when the Horizon View 3.0/3.1 client is installed within a VDI you are not given the option to "Logon As Current User" this is essentially the trick for this, so all credentials are automatically passed through. To work around this we need to use the vdm_Client.adm template to apply this settings at a group policy level.

1. The first thing we need to do is download the Horizon 6 Group Policy Templates. They can be downloaded at the following link.
- [https://my.vmware.com/group/vmware/details?downloadGroup=VIEW-601-GA&productId=420&rPId=6889](https://my.vmware.com/group/vmware/details?downloadGroup=VIEW-601-GA&productId=420&rPId=6889)
2. Once we have the admin templates downloaded we need to create a new group policy using the vdm_Client.adm template.
1. Load up Group Policy Management and create a new GPO
2. Import the vdm_client.adm template by navigating to Computer Configuration/Policies/Administrative Templates, Right Click and Select Add template. Select vdm_client.adm and select ok.
3. Once the client is loaded we can expand Classic Administrative Templates and now we see a new set of policies "VMware View Client Configuration"
4. If we navigate to the "Scripting Definitions" subfolder we can configure the Server URL, and if needed any specific logon username, password and application launch settings.
5. Next we will navigate to the "Security Settings" subfolder and we can configure "Default value of the 'Log in as current user' checkbox, by default this is disabled, so we will want to set this to be enabled.
6. We can now close the group policy editor and review the settingsviewclient
7. Upon launching the Horizon View client, it will now automatically login to the URL specified with the currently logged on user.
8. Right Click the Published Application and you have two choices. Create Shortcut, or Add to Start Menu.
9. Now when a user launches a shortcut the Horizon View client will seamlessly launch.
