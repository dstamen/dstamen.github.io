---
layout: post
title: Office 365/Exchange EAC Pop Ups not working with Chrome 37
categories:
- Messaging
comments: true
---
Chrome depreciated one of the features that allowed these popups to work, here is a temporary workaround to get it working.

Download the Chrome Policy Plugin [here](http://dl.google.com/dl/edgedl/chrome/policy/policy_templates.zip)

1. Open the zip file you just downloaded and locate the .ADM file that best matches your system:
2. Extract the .ADM file to any folder on your hard drive
3. Go to Start > Run, and run gpedit.msc
4. Right-click Local Computer Policy > Computer Configuration > Administrative Templates, and select Add/Remove Templates:
5. Add the adm template that you saved to disk earlier:
- You should now see the template underneath a Google > Google Chrome section within Administrative Templates
- 2. Depending on which operating system you have, it might be under a Classic Administrative Templates (ADM) folder:
6. Click on Google Chrome in the left-hand pane and then double-click on the item called Enable deprecated web platform features in the list within the right-hand pane:
- NOTE: It helps to sort the table in the right-hand pane by the Setting column in order to find the Enable deprecated web platform features item more easily.
7. In the new screen that appears, click the Enabled radio button:
8. In the Options section of the same screen, click the Show… button
9. On the new screen that appears, type ShowModalDialog_EffectiveUntil20150430 into the first cell of the table that’s displayed and hit ENTER:
-IMPORTANT NOTE: Make sure there are no spaces either before or after the ShowModalDialog_EffectiveUntil20150430  Otherwise, Chrome will reject the setting (see the Troubleshooting section for more information).
10. Click OK
11. To verify that this policy has taken effect, navigate to the following URL in Chrome: chrome://policy
12. If everything is set up correctly, you should see a screen like the following

![](/images/chromemodal.jpg)
