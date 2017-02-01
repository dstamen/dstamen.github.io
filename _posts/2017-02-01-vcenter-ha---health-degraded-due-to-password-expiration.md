---
layout: post
title: "vCenter HA - Health Degraded due to Password Expiration"
categories:
- VMware
comments: true
---
One of my favorite new features of vSphere 6.5 is definately vCenter HA. I was checking out alerts when I noticed i had an alarm for vCenter HA being degraded.

![](/images/vchaerror1.png)

Looking through the GUI, I was unable to find anything in regards to why the Health was a warning and why the components would not sync. Then I remembered a previous case I had opened for VCHA. 

There is a log file located in ***/var/log/vmware/vcha***

As soon as i opened up ***vcha.log*** the issue was plain and clear.

```
--> VMware vCenter Server Appliance 6.5.0.5100
-->
--> Type: vCenter Server with an embedded Platform Services Controller
-->
--> WARNING: Your password has expired.
--> Password change required but no TTY available.
--> rsync: connection unexpectedly closed (0 bytes received so far) [sender]
--> rsync error: error in rsync protocol data stream (code 12) at io.c(226) [sender=3.1.2]
--> ]
2017-01-31T08:00:22.515-05:00 warning vcha[7F80E0818700] [Originator@6876 sub=RsyncRepl-largeFrp] Rsync failed for vmw, retrying in 2 secs
2017-01-31T08:00:24.666-05:00 error vcha[7F80E0818700] [Originator@6876 sub=VchaUtil] Error executing command /usr/bin/rsync: exit status=[12], stdout=[], stderr=[
```

My Password has expired! How is this possible? Lucky for me [Féidhlim O'Leary](https://haveyoutriedreinstalling.com/2017/01/16/caution-vcha-user-password/) has already encountered this issue, and opened up a support case. The problem is due to the vcha user password expiring, it's quite a simple fix.

If you check the password age, you can see when the last password change is. This example my password has not expired yet, you can check the expiration date but running ***chage --list vcha***

```
root@vc [ ~ ]# chage --list vcha
Last password change                                    : Jan 05, 2017
Password expires                                        : Mar 06, 2017
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 1
Maximum number of days between password change          : 60
Number of days of warning before password expires       : 7
```
If the password is already expired, you can reset it by typing

```
passwd vcha
```

**Note: You will need to do this on all 3 nodes. You can ssh to the peer and witness through the primary if you know those IP's**

Now, we can set our password to not expire.

```
root@vc [ ~ ]# chage -m 0 -M 99999 vcha
```

If we recheck the password expiration, we can now see it is set to not expire.

```
root@vc [ ~ ]# chage --list vcha
Last password change                                    : Jan 05, 2017
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```

We will need to wait a few minutes for our replication cycles to complete, and voila! VCHA is now Healthy!

![](/images/vchaerror1.png)
