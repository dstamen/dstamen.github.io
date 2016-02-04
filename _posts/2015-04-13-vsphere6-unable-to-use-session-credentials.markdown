---
layout: post
title: vSphere6 - Unable to use session credentials
categories:
- VMware
comments: true
---
So one thing I have come across with a few VCSA6 installs was the inability to use login with current credentials via the Web client or vSphere client.

![](/images/Screen-Shot-2015-04-13-at-10.57.41-AM.png)

Working with VMware support we were finally able to get it working with a few tweaks and there is a current pending KB that has not been published yet. (KB2113038) I have been told this affects both an embedded deployment (VCSA and PSC together) and external deployment (VCSA and PSC seperate.)

###If using an embedded VCSA+PSC make sure the VM is joined to the domain. If using an external VCSA and PSC you can easily join the PSC to the domain using the vSphere Web Client.

1. Log in to your vSphere Web Client.
2. Navigate to Administration->System Configuration->Nodes
3. Select your PSC and select the Active Directory Tab.
- From here you can enter in your domain and credentials and join it to the domain, after it is successful you will need to restart the PSC.

![](/images/Screen-Shot-2015-04-13-at-11.37.23-AM.png)

###If you try to select your VCSA and look for the Active Directory tab you will notice it is missing, to join your VCSA to the domain you need to perform the domain join via the CLI.

1. SSH to your VCSA
2. Query the device to see if it is joined to the domain
- /opt/likewise/bin/domainjoin-cli query
![](/images/Screen-Shot-2015-04-13-at-11.42.37-AM.png)
3. Join the device to the domain using the following syntax, you will need to enter int he domainname, user with rights to join domain
- /opt/likewise/bin/domainjoin-cli join domainname adminusername
![](/images/Screen-Shot-2015-04-13-at-11.43.31-AM.png)
4. Once it is successful reboot the system and rerun the query to see if it was successfully joined
- /opt/likewise/bin/domainjoin-cli query
![](/images/Screen-Shot-2015-04-13-at-11.43.45-AM.png)

###At this point if you try to login with the current credentials you will still fail as there is one additional step. This will need to be completed on the VCSA virtual machine.

1. SSH to the appropriate appliance
2. Navigate to /etc/ and using your favorite text editor modify the nsswitch.conf file. (Examples are using VI)
3. Look for the line "password: compat ato" this line will need to be modified
![](/images/Screen-Shot-2015-04-13-at-11.01.00-AM.png)
4. Modify the line to read "passwd: compat ato lsass"
![](/images/Screen-Shot-2015-04-13-at-11.02.20-AM.png)

5. Once you have updated the file and saved it, restart the VCSA or its services
- service vmware-vpxd restart
6. Now wait....in multiple tests it takes 30 minutes until you are able to logon using the credentials and it will now work for both the web and c# client.
- In some cases this file will also need to be modified on the PSC.
