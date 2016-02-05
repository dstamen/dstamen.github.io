---
layout: post
title: "Using Ansible to Create Cisco ACI Filters"
categories:
- Ansible
- Cisco
comments: true
---
In the midst of rolling out Cisco ACI, we have a need to automation creation of filters to apply to contracts. I tried to use the ACI-PowerTool for this task, however it doesnt seem to work with the newer code we are on. So I went back and attempted to use the ansible modules and it worked flawlessly, below is a sample playbook that will create a filter and add the associated filter entries. The below example are the required ports for Horizon View.

#### ***Pre-Requsites***
- [aci-ansible](https://github.com/jedelman8/aci-ansible.git)
- [ansible](http://docs.ansible.com/ansible/intro_installation.html)

#### ***Link to Script***
- [horizonviewports.yml](https://github.com/dstamen/ACI-Ansible/blob/master/horizonviewports.yml)

#### ***Preparing to Execute the Script***

*This script assumes you have already installed and configured Ansible, downloaded the Git Repo and installed the Cisco ACI Cobra SDK.*

{% highlight yaml %}
---

- name: playbook to create HorizonViewPorts-FIL
  hosts: apic
  connection: local
  gather_facts: no

  tasks:
      # ensue filters exist
      - aci_filter: name={{ item }} tenant=common host={{ inventory_hostname }} username={{ user }} password={{ pass }}
        with_items:
        - HorizonViewPorts

      - aci_filter_entry: name=HighEndPorts-tcp proto=tcp tenant=common filter=HorizonViewPorts-FIL dest_from_port=40000 dest_to_port=65000 state=present host={{ inventory_hostname }} username={{ user }} password={{ pass }}
      - aci_filter_entry: name=HighEndPorts-udp proto=udp tenant=common filter=HorizonViewPorts-FIL dest_from_port=40000 dest_to_port=65000 state=present host={{ inventory_hostname }} username={{ user }} password={{ pass }}
      - aci_filter_entry: name=HTML-Access proto=tcp tenant=common filter=HorizonViewPorts-FIL dest_from_port=22443 dest_to_port=22443 state=present host={{ inventory_hostname }} username={{ user }} password={{ pass }}
      - aci_filter_entry: name=http proto=tcp tenant=common filter=HorizonViewPorts-FIL dest_from_port=http dest_to_port=http state=present host={{ inventory_hostname }} username={{ user }} password={{ pass }}
      - aci_filter_entry: name=https proto=tcp tenant=common filter=HorizonViewPorts-FIL dest_from_port=https dest_to_port=https state=present host={{ inventory_hostname }} username={{ user }} password={{ pass }}
      - aci_filter_entry: name=JMS proto=tcp tenant=common filter=HorizonViewPorts-FIL dest_from_port=4001 dest_to_port=4002 state=present host={{ inventory_hostname }} username={{ user }} password={{ pass }}
      - aci_filter_entry: name=MMR proto=tcp tenant=common filter=HorizonViewPorts-FIL dest_from_port=9427 dest_to_port=9427 state=present host={{ inventory_hostname }} username={{ user }} password={{ pass }}
      - aci_filter_entry: name=PCoIP proto=tcp tenant=common filter=HorizonViewPorts-FIL dest_from_port=4172 dest_to_port=4172 state=present host={{ inventory_hostname }} username={{ user }} password={{ pass }}
      - aci_filter_entry: name=PCoIP-udp proto=udp tenant=common filter=HorizonViewPorts-FIL dest_from_port=4172 dest_to_port=4172 state=present host={{ inventory_hostname }} username={{ user }} password={{ pass }}
      - aci_filter_entry: name=USB proto=tcp tenant=common filter=HorizonViewPorts-FIL dest_from_port=32111 dest_to_port=32111 state=present host={{ inventory_hostname }} username={{ user }} password={{ pass }}

{% endhighlight %}

#### ***Execute the Script***
- Run ansible-playbook horizonviewports.yml -i hosts
