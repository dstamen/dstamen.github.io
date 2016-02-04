---
layout: post
title: "Indexing your Horizon View Database"
categories:
- Horizon View
comments: true
---
I am currently troubleshooting some issues with the Horizon event database having some performance issues. Working with support they pointed me to [KB2094580.](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2094580)

By Default the view event database is not indexed. I was curious as to way I always had issues pulling up events in the Horizon View Administrative interface, but as soon as I followed the steps, it was almost immediate now, where i use to have to wait an extremely long time.

To create an index on your event database run the following command on your SQL event database. XXX is the prefix of your database, if you do not have a prefix set, just leave it as **dbo.event_data**.

{% highlight SQL %}
CREATE INDEX IX_eventid ON dbo.XXXevent_data (eventid)
{% endhighlight %}

![](/images/indexviewdb.png)

***Your Horizon View DB is now Indexed. Enjoy the Speed!***
