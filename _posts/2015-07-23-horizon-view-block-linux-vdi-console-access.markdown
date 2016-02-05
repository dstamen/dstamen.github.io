---
layout: post
title: Horizon View - Block Linux VDI Console Access
categories:
- Horizon View
comments: true
---
So I have had some time to play around with the new Linux Horizon View Agent and using Ubuntu as a VDI guest and it works pretty well. However as most of us have seen, when a user is logged onto the guest the screen is shown in the console. In some organizations this may pose a privacy or security risk.

Right now there is no true workaround as that is how the view session is handled, however there is a workaround to disable console access.

## To disable console access perform the following steps.

1. Shutdown VM.
2. Edit Settings
3. Select Options Tab, General and then select Configuration Parameters
4. Select Add Row
- For Name type in RemoteDisplay.maxConnections
- For Value type in 0
5. Hit OK, and Power on your VM.

This does limit some troubleshooting as if a user has issues you wont be able to see the console of the VM, but it is currently the only workaround and has a small tradeoff.
