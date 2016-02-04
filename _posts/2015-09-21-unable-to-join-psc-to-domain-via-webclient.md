---
layout: post
title: "Unable to join PSC to Domain via Webclient"
categories:
- VMware
comments: true
---
I am actually pretty surprised this bug still exists. I came across this issue with my first deployment of vSphere 6. Now I am circling back around to do a POC and it still exists.

When trying to join a Platform Services Controller to the domain via the vSphere Webclient I get the following error: **"java.lang.reflect.invocationTargetException"**

![](/images/pscdomainerror.png)

There are currently two workarounds now with 6.0U1 I am aware of.

- The first method is to join to the domain using the CLI.

{% highlight bash %}
/opt/likewise/bin/domainjoin-cli join domain username
{% endhighlight %}

- The second method is to use the new PSC interface to join to the domain.
  - Navigate to **https://fqdnofpsc/psc**
  - Select **Appliance Settings**
  - Click on **Manage**
  - Under **Active Directory** Select Join and enter in your details

![](/images/pscdomainerror2.png)


Why this method works here, and not in the VCSA Webclient is confusing to me, however here you go. Hopefully it helps you resolve the issue the next time you come across it.
