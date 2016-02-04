---
layout: post
title: "Upgrading VCSA from 6.0 U1a to 6.0U1b using CLI"
categories:
- VMware
comments: true
---
Welcome to my post about upgrading your VMware vCenter Server Appliance (VCSA) to 6.0 U1b.

This process is very straight forward. We will begin with updating our Platform Service Controllers (PSC) and then proceed with the vCenter Appliance.

- SSH to your Primary PSC.
- If you are currently in the bash shell, type appliancesh to switch shells to run the update.
- Run **software-packages install --url --acceptEulas** to download and install the packages from the VMware Repo.
  - You can use the --ISO switch or supply a custom url as well if needed.
- Sit back and wait. Once it is finished you will be prompted to reboot.
  - Reboot by typing shutdown reboot /r reason

![](/images/pscupgrade1.png)

- When VM boots you will now be at the latest version.

![](/images/pscupgrade2.png)


- Repeat if you have additional PSC's in your environment.

Now that our Platform Service Controllers are upgraded we can proceed on with our vCenter Appliance.

- SSH to your vCenter Appliance.
- If you are currently in the bash shell, type appliancesh to switch shells to run the update.
- Run **software-packages install --url --acceptEulas** to download and install the packages from the VMware Repo.
  - You can use the --ISO switch or supply a custom url as well if needed.
- Sit back and wait. Once it is finished you will be prompted to reboot.
  - Reboot by typing shutdown reboot /r reason

![](/images/vcupgrade1.png)

- When VM boots you will now be at the latest version.

![](/images/vcupgrade2.png)
