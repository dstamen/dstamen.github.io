---
layout: post
title: "Reusing Horizon View Desktop Names"
categories:
- Horizon View
comments: true
---
Have you ever worked with a Horizon View pool with 10 VM's and deleted 3 and it recreated as 11? May want to pay attention to learn how you can reuse view desktop names.

First you will need to connect to the ADAM database on one of your servers. Use [KB2012377](http://kb.vmware.com/kb/2012377) for instructions.

To connect to the View ADAM database:

- Log in to one of the View Connection Servers as Domain Administrator.
- Click Start > Administrative Tools > ADSI Edit.
- In the console window, right-click ADSI Edit and click Connect to.
- In the Name field type:
  - View ADAM Database
- Select Select or type a Distinguished Name or Naming Context.
- In the field below Select or type a Distinguished Name or Naming Context, type:
  - dc=vdi,dc=vmware,dc=int
- Select Select or type a domain or server.
- In the field below Select or type a domain or server, type:
  - localhost:389
- Click OK.
- Click View ADAM Database [localhost:389] to expand.
- Click DC=vdi,dc=vmware,dc=int to expand.

![](/images/viewadamconnectionsettings.png)

Now perform the following steps to set the pool to reuse the VM Names

- Expand dc=vdi,dc=vmware,dc=int
- Expand OU=Server Groups
- Double Click CN=(Pool Name)
- Find the entry "pae-VmNameReuseAllowed"
  - Open this entry and change the value to 1

![](/images/viewreuseattribute.png)

The next VM should now start reusing the old VM names that were in the pool.
