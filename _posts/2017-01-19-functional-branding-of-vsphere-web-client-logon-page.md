---
layout: post
title: "Functional Branding of vSphere Web Client Logon Page"
categories:
- VMware
comments: true
---
I had a use case I wanted to investigate in regards to the new VCHA that is part of VMware vCenter Server 6.5. One thing I noticed, is when you have VCHA configured, there is no way to know which node of the HA cluster you are connecting to without being logged on.

As people have noted before [William Lam's - How to Customize Webclient Login UI](http://www.virtuallyghetto.com/2015/02/how-to-customize-the-new-vsphere-6-0-web-client-login-ui.html)

I figured since I am using the embedded SSO, I could update the login page to show any information for that particular node. In my case I updated the text to show which node you are connected to. You can see this without even logging in!

![](/images/webclientbranding.png)

How can I do this you ask? Easy! You just need to update one file, two if you would like to update your logo...

- Logon to your PSC or VC with Embedded PSC via SSH or FTP.
- Make sure to backup the files before making any changes!
- Update the following file **/usr/lib/vmware-sso/vmware-sts/webapps/websso/WEB-INF/views/unpentry.jsp**
  - If you look at lines 126-131, you can see a few lines of code you will need to update.
  - Line 127 - You can input your text here, my example was to post if i was connected to Primary or Secondary.
  - Line 130 - I commented out to hide the "VMware vCenter Single Sign-on" logo.
- To update your logo, you can overwrite the following file **/usr/lib/vmware-sso/vmware-sts/webapps/websso/resources/img/vmwareLogoBigger.png**
  - You may need to adjust your logo size for the right look
- Save and Upload your file and refresh your webclient UI and you will see your new branding!

Here is a snippet of my code.

```
   <div id="productName">
  Welcome to my Homelab!</br><h6>Connected to Primary Appliance (vcsa6-01.lab.local)</h6></br>
    <script type="text/javascript">
      if (isVCLogin()) {
        //document.write("<img id=\"VCSSO-Title\" src=\"../../resources/img/VCSSO-title.png\" />");
      }
```

Please note this is #unsupported, but extremely useful! Hope you enjoy it. Leave a comment if you have any questions.
