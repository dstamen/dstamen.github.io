---
layout: post
title: Unable to Configure Event Database in vRealize Operations View Broker Agent
categories:
- Horizon View
- vRealize Operations
comments: true
---
I was in the process of getting vRealize for Horizon configured, and as I was going through the broker agent configuration for the life of me I couldn't get the eventdb portion to work. Everytime i entered in the user name and password, I would receive the following error. **FAILED (Format of the initialization string does not conform to specification starting at index 88.)**

![](/images/vROeventdb.png)

I knew it wasn't a password issue as I was able to logon to SQL Manager with no issue, and the Horizon View EventsDB was working fine, so I went on a google search to try to hunt through logs. SQL Server was reporting i was entering the wrong password which made me think. In past issues some applications haven't like certain characters in passwords.

I came across this blog [http://stackoverflow.com/questions/2030610/password-limitations-in-sql-server-and-mysql](http://stackoverflow.com/questions/2030610/password-limitations-in-sql-server-and-mysql)

So in the configuration page i entered in my password as **"password"** and voila it worked!
