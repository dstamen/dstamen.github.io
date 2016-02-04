---
layout: post
title: Identify DirSync Distribution Groups in Office365
categories:
- Messaging
comments: true
---
So after recently implementing directory sync i wanted to make sure any new groups were properly set up in active directory.

Unfortunately i was unable to find any commands so thanks to MS Support I was able to find a way to identify these. You would think it would be under Get-DistributionGroup but it is actually under Get-MSolGroup. After connecting via remote powershell you can run the below command to see all that are not synced.

{% highlight powershell %}
Get-MsolGroup -All | Select DisplayName, LastDirSyncTime | Where-Object {$_.LastDirSyncTime -eq $null}
{% endhighlight %}
