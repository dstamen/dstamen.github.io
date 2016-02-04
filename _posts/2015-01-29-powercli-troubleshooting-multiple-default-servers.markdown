---
layout: post
title: PowerCLI - Troubleshooting Multiple Default Servers
categories:
- PowerCLI
comments: true
---
I use a customized version of [http://www.virtu-al.net/vcheck-pluginsheaders/vcheck/](http://www.virtu-al.net/vcheck-pluginsheaders/vcheck/) by Alan Renouf to connect to multiple servers. However a coworker of mine was trying to run it, and the script would only return data from the 2nd vCenter we were connecting to.

Doing some troubleshooting we noticed their DefaultVIServerMode was set to single. This means that only a single servers connection will occur at once. Changing this setting is very easy, there are 3 scopes, but only one really needs to be set. You can review the 3 scope options [https://www.vmware.com/support/developer/PowerCLI/PowerCLI51/html/Set-PowerCLIConfiguration.html](https://www.vmware.com/support/developer/PowerCLI/PowerCLI51/html/Set-PowerCLIConfiguration.html)

See below for command to run, for Session scope which is valid for the current vSphere PowerCLI session only and overrides any User and All Users settings.

{% highlight powershell %}
Set-PowerCLIConfiguration -DefaultVIServerMode multiple -Scope Session -Confirm:$false
{% endhighlight %}
