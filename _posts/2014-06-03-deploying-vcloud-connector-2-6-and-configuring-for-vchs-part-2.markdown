---
layout: post
title: Deploying vCloud Connector 2.6 and Configuring For vCHS (Part 2)
categories:
- vCloud Air
comments: true
---
Here is Part 2  a continuation of Deploying vCloud Connector 2.6 and Configuring For vCHS (Part 1) (http://davidstamen.com/2014/06/03/deploying-vcloud-connector-2-6-and-configuring-for-vchs-part-1/)  where we will configure vCloud connector to your Private(vCenter) and Public(vCHS) clouds.

Lets start with getting the vCloud Connector Server ready. Just in case you forgot what IP you assigned we can open the appliance and view the management information.

![](/images/screenshot.19.jpg)

As we can see here the URL to configure the appliace is https://192.168.0.13:5480 and the default username is admin and default password is vmware.

Once logged in it is best to update the timezone. Select your timezone and make sure to Save Settings.

![](/images/screenshot.21.jpg)

It is also best to make sure you change the default passwords, so select the Server tab and enter in your new information.

![](/images/screenshot.22.jpg)

The next thing we want to do is make sure we register the vCloud Connector Server with vCenter so we get the plugin to manage the solution. Select the vSphere Tab underneath server and enter in your vCenter information and make sure to select register.![](/images/screenshot.231.jpg)

![](/images/screenshot.24.jpg)

Now that we have vCloud Connector registered with vCenter and the vSphere client we can go away and add in our nodes.

Navigate to the nodes tab and select Register Node.

![](/images/screenshot.25.jpg)

In order to register vCHS as a node we first need to logon and gather some information. So navigate to https://vchs.vmware.com and select your VDC. On the right hand side expand vCloud Director API URL underneath Related Links. We will need to copy the first aprt of the URL. In our case https://p1v17-vcd.vchs.vmware.com

![](/images/screenshot.27.jpg)

Here we will need to enter in the vCHS tenant information. Our Display Name(This will be the cloud name within vCloud Connector) the Node URL(This is the link to your vCHS Instance, append 8443 as vCHS uses a different port), If it is a public cloud(vCHS), Cloud Type will be vCloud Director, vCD-Org Name will be your vCD name within vCHS and then username and password will be your vCHS Information.

![](/images/screenshot.281.jpg)

Once you are done select register and you will see your vCHS instance successfully registered. You will also note it appended the full url to the organization.

![](/images/screenshot.29.jpg)

Now we need to go ahead and configure our vCloud Connector Node to be able to add our vCenter(Private Cloud). Navigate to the management IP port 5480 and use the default username admin and password vmware as we did with the server. Make sure to update the timezone and password appropriately as we did above.

Now we will navigate to the node tab and select Cloud Registration. This is where we will enter in our vCenter server. Enter in your vCenter IP and make sure to select Ignore SSL Cert if you are using the default certificate or future steps will fail. Select Update configuration and we are all done configuring the node.

![](/images/screenshot.35.jpg)

We will now go back to the vCloud Connector Server to register our additional node. Enter in the Display Name in which it will show up in the management console, the node URL, will be the IP of the vCloud Connector Node, Cloud Type will be vSphere and the credentials will be an account with administrator rights into vCenter.

![](/images/screenshot.37.jpg)Select Register and you should now see your private and public clouds registered.

![](/images/screenshot.38.jpg)

Now that the vCloud Connector Server is all ready we can now add the Clouds we registered as nodes. Lets navigate to our vSphere client and look at a new plugin that has been added.

![](/images/screenshot.39.jpg)

Once selected we can now add objects to our cloud, select Clouds and select the green + sign to add our private and public clouds to manage.

![](/images/screenshot.40.jpg)

Lets add our Public Cloud (vCHS) First. From the Drop down for name select the display name you set above. All we need to enter here is your vCHS username and password and select Add.

![](/images/screenshot.411.jpg)

Now we can add our vCenter (Private Cloud)

Select the + sign again and choose your vCenter node you registered previously. Enter in the same username and password you used to register the node.

![](/images/screenshot.42.jpg)

Now if we go back to our Clouds tab we can now see both our public and private clouds registered.

![](/images/screenshot.43.jpg)

You can now migrate your private cloud workloads to the public cloud!

[Deploying vCloud Connector 2.6 and Configuring For vCHS (Part 3)](http://davidstamen.com/2014/06/04/deploying-vcloud-connector-2-6-and-configuring-for-vchs-part-3/)
