---
layout: post
title: Enable SSH on vSphere Management Assistant 5.0
categories:
- VMware
comments: true
---
While continuing to build out my lab for VCAP-DCA today I had to deploy the vMA (vSphere Management Assistant). Upon deployment i tried to SSH to it and unfortunately was not able to. By default SSH is turned off, perform the steps below to enable it.

1. Logon to vMA via a Console Session
2. Run
- 'sudo vi /etc/hosts.allow'
3. Scroll to the very bottom and type ***i*** to insert content into the file.
4. On the last line add 
- 'sshd: ALL: ALLOW'

![](/images/vmaa1.jpg)

5. Hit 'ESC' then type ':wq!' to save.
6. Restart SSH services to enable the change.
- 'sudo /etc/initd/sshd restart'

![](/images/vmaa2.jpg)

7. You will now be able to SSH to the vMA.
