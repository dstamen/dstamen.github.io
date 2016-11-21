---
layout: post
title: "vSphere 6.5 - vCenter HA (VCHA) Issues"
categories:
- VMware
comments: true
---
So as everyone has probably seen, [vSphere 6.5](https://blogs.vmware.com/vsphere/2016/11/vmware-announces-general-availability-vsphere-6-5.html) is now GA. One of the features i have been waiting for the most is vCenter HA. I have spent some time trying to get this working in my lab. Unfortunately after countless tries i was stuck. Thanks to folks in the vExpert Slack for helping me try to resolve this, but unfortunately this was a case for VMware Support.

Every time I would try to configure vCenter HA using the Advanced Wizard, I would get the following error.

```
The operation is not allowed in the current state.
Failed to get management network information. Verify if management interface (NIC0) is configured correctly and is reachable.
```

  ![](/images/vcha1.png)

Obviously, if I am accessing the vCenter the management IP has to be configured and reachable correct?

Turns out we tried to look through the logs in **/var/log/vmware/vcha** and they were no help. Next the technician tried to manually prepare for VCHA by running **prepare-vcha**. Once we ran this we were able to see a specific error outputted.

```
Unable to get hostname resolved IP address for eth0
```
![](/images/vcha2.png)

This is more helpful! Turns out my vCenter somehow was missing it's reverse DNS entry. This is definitely bizarre as the VCSA requires a reverse DNS to deploy.

Once I created the reverse DNS, the wizard finally let me through and configure vCenter HA!

Big thank you to the vExpert community and VMware Support.

Look forward to a formal KB and a more descriptive error in the future.
