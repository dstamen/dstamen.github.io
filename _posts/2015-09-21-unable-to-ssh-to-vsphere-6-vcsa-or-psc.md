---
layout: post
title: "Unable to SSH to vSphere 6 VCSA or PSC"
categories:
- VMware
comments: true
---
So I am in the midst of setting up a vSphere 6 POC and it has been a bit since I played with it. I came across a problem I thought i would document and share.

While trying to setup my Platform Service Controllers for HA. I was having issues sshing into the appliance. I kept on getting errors, that the packet sizes were too big or just authentication would fail.

By Default the PSC and VCSA have a default shell of /bin/appliancesh.

To correct the issue we need to change the shell.
{% highlight bash %}
chsh -s "/bin/bash" root
{% endhighlight %}

Once it is changed, we can now ssh/scp to it.
