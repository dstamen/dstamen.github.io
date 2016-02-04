---
layout: post
title: "Upgrading Horizon View Linux Desktop"
categories:
- Horizon View
comments: true
---
Horizon 6.2 is now available and Linux support has improved. Previously it was only supported on a limited set of older operating systems.

Originally when we deployed we had deployed Ubuntu 12.04, however now the newer kernel 14.04 is supported so I will show you how to upgrade your desktop to the latest version and now use the new agent as well.

If you followed my [previous]({{ site.url }}/horizon%20view/horizon-view-block-linux-vdi-console-access/) post to disable Console access. Go ahead and shutdown the desktop and change it back to **1** to enable console, or you can do this all via **SSH** as well.

Load up **xterm** and type in the following commmand to upgrade the linux kernel.

{% highlight text %}
do-release-upgrade
{% endhighlight %}

This process will take some time and will run through all the updates, it can take a bit of time so grab a cup of coffee and sit back and wait.

![](/images/viewlinuxupdate1.png)

Once it is done, it will let you know its time to reboot.

![](/images/viewlinuxupdate2.png)

Now that the system is upgraded we can now upgrade the view agent which is very simple.

[Download](https://my.vmware.com/web/vmware/downloads) the latest View Agent for Linux.

- SCP/SFTP/Etc...the agent to your linux box. In my case I put it in /tmp
- cd to /tmp and run **tar -xzvf <viewagentfilename>**
- cd to the directory based on the name of your file
- Run **sudo ./install_viewagent.sh**
- Reboot and you are now done.
- If you enabled console again, follow the steps in the [post]({{ site.url }}/horizon%20view/horizon-view-block-linux-vdi-console-access/) to block console sessions again.

***Your View Linux Desktop is now upgraded! Now enjoy the new features!***
