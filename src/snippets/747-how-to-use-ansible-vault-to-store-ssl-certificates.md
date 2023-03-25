---
id: '747'
title: How to use Ansible Vault to store SSL certificates
languages:
- bash
tags:
---
Playbook
--------

In **playbook.yml**, list the file where we'll put the SSL certificates:


```bash
---
- hosts: servers
  roles:
...
  vars_files:
    - vault/certs/{{ domain }}.yml # Private SSL certificates
```
    

Ansible Vault
-------------

Next, create an encrypted Ansible vault (one per domain):


```bash
$ ansible-vault create vault/certs/xxx.com.yml
```
    

Put the following in the **vault/certs/xxx.com.yml**:


```bash
certificates:
  - name: "xxx.com.pem"
    content: |
      -----BEGIN CERTIFICATE-----
  - name: "login.xxx.com.pem"
    content: |
      -----BEGIN CERTIFICATE-----
```
    

The last thing we need to do is copy the certificates from the Ansible Vault to the server (**roles/ssl\_certs/tasks/main.yml**):


```bash
- name: Copy private SSL certificates from Ansible Vault
  tags: ssl_certs
  copy:
    content: "{{ item.content }}"
    dest: "/etc/ssl/private/{{ item.name }}"
    owner: root
    group: root
    mode: "u=rw,g=r,o="
  sudo: yes
  with_items:
    # Certificates are stored encrypted in vault/certs/{{ domain }}.yml
    - "{{ certificates }}"
```
    

Usage
-----

Use **ask-vault-pass** to specify the Ansible Vault's password at deployment:


```bash
$ ansible-playbook -i inventory/hosts --limit server1 --tags "ssl_certs" playbook.yml -v --ask-vault-pass
```
    

