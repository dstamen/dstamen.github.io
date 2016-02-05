---
layout: post
title: SRM - Unable to uninstall due to UAC
categories:
- Site Recovery Manager
comments: true
---
I was trying to remove SRM 5.1 from our environment and kept getting an error that UAC must be disabled. Even though UAC was set to "Never Notify" SRM didnt like this.

![](/images/Screen-Shot-2015-02-18-at-9.01.23-AM.png)

To fully disable UAC run the following command from an elevated command prompt and then reboot the system.

```
REG ADD “HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System” /v EnableLUA /t REG_DWORD /d 0 /f
```

#### Note:
You can also avoid this by doing the uninstall as the builtin local administrator account
