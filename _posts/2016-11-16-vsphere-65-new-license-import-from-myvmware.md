---
layout: post
title: "vSphere 6.5 - New License Import from My VMware"
categories:
- VMware
comments: true
---
So as everyone has probably seen, [vSphere 6.5](https://blogs.vmware.com/vsphere/2016/11/vmware-announces-general-availability-vsphere-6-5.html) is now GA. As usual right away I have upgraded the homelab and have already found a neat new feature.

When you are adding in your VMware licenses, you now have an option to **Import License Keys Data...**

To start you need to generate a report from [my.vmware.com](http://my.vmware.com).

- Log in and Navigate to **Download Reports**

- Click on the **Available Reports** dropdown, and select the **Product Licenses, Details and History.** You will be asked which account you would like to select, and if there was a specific timeframe to select. In my case i have selected all accounts and then click Create.

- The report will take about a minute to generate. You can click on **Refresh Table.** Once the report shows as complete. You can download it as a CSV. You will need this to complete the next steps.

-  Log into your vSphere 6.5 Flash client **(http://fqdn/vsphere-client)** and click on **Home** and then **Licenses.** In the top right corner you will see an option to **Import License Keys Data...**

  ![](/images/licensekey1.png)

- Now you will browse to the file you downloaded from **my.vmware.com.** If you have not downloaded it yet, you can select on **Learn how to generate this CSV file** to be shown the steps. Click **Next**.

  ![](/images/licensekey2.png)

- At this point, the uploaded CSV file will be analyzed to see what licenses can be imported into your vCenter Inventory. Click **Next**.

  ![](/images/licensekey3.png)

- The next screen will show what licenses were part of the CSV and give you an Overview. Click **Next**.

  ![](/images/licensekey5.png)

- If you have any existing keys, it will update them with the My VMware settings, if there are new keys it will add them with the notes from My VMware.

  ![](/images/licensekey4.png)

This new feature is definitely a step in the right direction. Maybe in vNext you can log directly into your My VMware account from the Web Client and have it automatically pull in your licenses.  
