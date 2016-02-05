---
layout: post
title: Unable to Install .NET 3.5 on Server 2012R2
categories:
- Windows
comments: true
---
So upon trying to install .Net 3.5 on a new server today it would not allow me to, it kept telling me the source files were unavailable even after pointing to source directly to multiple ISO's and copied the files locally.

![](/images/dotneterror.jpg)

Upon further research I stumbled across this microsoft KB article and used it to ultimately find my fix. [KB2734782](http://support.microsoft.com/kb/2734782">http://support.microsoft.com/kb/2734782)

### Here are the full steps I followed to get .NET installed.

1. Open **gpedit.msc** to modify your local group policy.
2. Navigate to <strong>Computer Configuration/Administrative Tools/System</strong> and there should be an option for <strong>"Specify Settings for optional component installation."</strong> Enable this option and select "Contact Windows Update directly to download repair content."
![](/images/dotnetstep2.jpg)

3. Now open up an elevated cmd/powershell prompt and run a gpupdate /force to enforce the new policy
4. Run the following command to install .NET
- DISM /Online /Enable-Feature /FeatureName:NetFx3 /All
