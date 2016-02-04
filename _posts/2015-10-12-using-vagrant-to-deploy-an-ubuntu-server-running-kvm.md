---
layout: post
title: "Using Vagrant to Deploy an Ubuntu Server running KVM"
categories:
- Vagrant
comments: true
---
With all this talk about VMware vs KVM I figured that I would attempt to load a base install of KVM to see what it was all about.

Here is a quick vagrant runbook that will quickly get a 3 linux servers deployed and installed with KVM to play with.

There are 3 nodes..MGMT01,KVM01 and KVM02. I use MGMT01 VMM to manage KVM01 and KVM02.

The code can be found [here.](https://github.com/dstamen/Vagrant/tree/master/ubuntukvm)

The bootstrap_installkvm.sh file runs the following commands to install KVM. 

{% highlight bash %}
sudo apt-get install --no-install-recommends lubuntu-desktop -y
sudo apt-get install qemu-kvm qemu-system libvirt-bin bridge-utils virt-manager -y
sudo adduser vagrant libvirtd
sudo reboot
{% endhighlight %}
