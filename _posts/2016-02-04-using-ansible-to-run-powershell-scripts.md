---
layout: post
title: "Using Ansible to Run Powershell Scripts"
categories:
- Ansible
comments: true
---
In the midst of playing with Ansible and figured my most common use case would be executing powershell scripts on remote servers, so scavenged around and put this together.

#### ***Pre-Requsites***
- [ansible](http://docs.ansible.com/ansible/intro_installation.html)
- [ansible-winrm](http://github.com/diyan/pywinrm/archive/master.zip#egg=pywinrm)

#### ***Link to Git Project***
- [ansible_powershell](https://github.com/dstamen/Ansible/tree/master/ansible_powershell)

#### ***Preparing to Execute the Script***

*This script assumes you have already installed and configured Ansible, downloaded the Git Repo and installed the WinRM python module.*

Define your group variables. Create a hostgroup.yml file in this folder. This is where you specify the username, password and WinRM port to use. This file should mimit the host group defined in your hosts file.

```yaml
ansible_ssh_user: admin
ansible_ssh_pass: password
ansible_ssh_port: 5985
ansible_connection: winrm
ansible_winrm_server_cert_validation: ignore
```

Here is the yaml code responsible for launching the script. Copy the script into the scripts directory and update the file.

```yaml
- name: Run Powershell Scripts
  hosts: test
  tasks:
    - name: run a powershell script
      script: scripts/hello.ps1
      register: out
    - debug: var=out
```

#### ***Execute the Script***
- Run ansible-playbook powershell.yml -i hosts
