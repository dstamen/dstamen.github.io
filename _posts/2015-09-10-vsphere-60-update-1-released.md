---
layout: post
title: "vSphere 6.0 Update 1 Released"
categories:
- VMware
comments: true
---
Today vSphere 6.0 U1 is released. This is normally the update everyone waits for before upgrading their production environments to the latest version. I think the first time in awhile, a lot of people will wait.

You see, VMware has had a bug [KB2124669](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2124669) since ESXi 6.0 that can cause an ESXi host to randomly lose connection, freeze and overall act really terrible. With the release of 6.0U1 it still exists.

Here is VMware's exlanation of the cause.
{% highlight text  %}
ESXi migrates interrupts across physical CPUs in order to load balance the interrupt activity in the system. As part of the ESXi
6.0 changes to increase the number of interrupts supported, provisions were made to retire a vector on an old physical CPU when
the interrupt migrates to a new one. In 6.0, interrupts tend to arrive at retired vectors, for unknown reasons at this time.
{% endhighlight  %}

There is however a workaround, but it can have an impact on CPU performance, and who want's that?

**To Install/Enable the script:**
{% highlight text  %}
1. Download the attached 2124669_stop_intr_mig.zip file.
2. Extract the file.
3. Copy the stop_intr_mig.py to the target ESXi host.
4. Enable the script when the system is running its most common 'steady state' workload. (Not idling. Not spiking.)
5. Run this command chmod +x stop_intr_mig.py.
6. To enable the script execute stop_intr_mig.py 1 or /bin/python stop_intr_mig.py 1
{% endhighlight  %}

However if you do feel like upgrading which I know must of us will at least do to our labs, here are the details.

[Download vSphere 6.0 U1](https://my.vmware.com/web/vmware/info?slug=datacenter_cloud_infrastructure/vmware_vsphere/6_0)

[vCenter 6.0 U1 Release Notes](http://pubs.vmware.com/Release_Notes/en/vsphere/60/vsphere-vcenter-server-60u1-release-notes.html)

[ESXI 6.0 U1 Release Notes](http://pubs.vmware.com/Release_Notes/en/vsphere/60/vsphere-esxi-60u1-release-notes.html)
