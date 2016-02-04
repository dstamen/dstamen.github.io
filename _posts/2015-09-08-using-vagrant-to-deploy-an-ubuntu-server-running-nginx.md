---
layout: post
title: "Using Vagrant to Deploy an Ubuntu Server running NGINX"
categories:
- Vagrant
comments: true
---
So as I was getting around to trying to get a host platform setup for a Jekyll blog I was looking at an alternative to GitHub Pages. I decided I would run it on Ubuntu Server using NGINX as the web platform.

Here is a quick vagrant runbook that will quickly get a linux server deployed and install NGINX to host your website.

The code can be found [here.](https://github.com/dstamen/Vagrant/tree/master/jekyll-nginx)

The bootstrap_linux_nginx.sh file runs the following commands to install NGINX. You can add commands to your file to automatically create your configuration and sites to publish automatically. By default this will just bring up the default nginx site.

{% highlight bash %}
sudo apt-get install nginx -y
sudo service nginx start
update-rc.d nginx defaults
{% endhighlight %}
