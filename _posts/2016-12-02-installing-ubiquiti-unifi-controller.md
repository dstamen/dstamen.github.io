---
layout: post
title: "Installing Ubiquiti Unifi Controller"
categories:
- Ubiquiti
comments: true
---
I have been using Ubiquiti equipment for awhile at home and I figured i would finally write a blog post about it. Ubiquiti equipment is "enterprise class" equipment for the consumer.

I figured I would create a post that goes over two ways of loading the controller. The first option will be installing it on Ubuntu on bare metal or a VM, the second option is a docker container.

If you are installing this on a bare metal or virtual machine, i suggest a debian based image. My preference is Ubuntu.

```
echo "deb http://www.ubnt.com/downloads/unifi/debian unifi5 ubiquiti" > \
  /etc/apt/sources.list.d/20ubiquiti.list && \
  echo "deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen" > \
  /etc/apt/sources.list.d/21mongodb.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50 && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

apt-get -q update && \
  apt-get install -qy --force-yes --no-install-recommends unifi && \
  apt-get -q clean && \
  rm -rf /var/lib/apt/lists/*

service unifi start
```

Once that completes you can access the controller at https://iporfqdn:8443

A second option is to use a docker container. I built an image through some testing that is hosted on dockerhub [dstamen/unifi](https://hub.docker.com/r/dstamen/unifi/). It works and there are plenty of images out there. It is based on the following [dockerfile](https://github.com/dstamen/unifi/blob/master/Dockerfile).

A few other containers to review that are highly recommended are [linuxserver/unifi](https://hub.docker.com/r/linuxserver/unifi/) and [jacobalberty/unifi](https://hub.docker.com/r/jacobalberty/unifi/)

I hope this helps you on our way to getting your controller online.
