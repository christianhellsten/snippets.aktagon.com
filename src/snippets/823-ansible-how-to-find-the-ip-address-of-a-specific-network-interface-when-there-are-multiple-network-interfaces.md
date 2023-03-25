---
id: '823'
title: 'Ansible: How to find the IP address of a specific network interface when there
  are multiple network interfaces'
languages:
- yaml
tags:
---
Here's how to find the IP address of a specific network interface that matches a given CIDR:

```yaml
- hosts: all
  gather_facts: false
  tasks:
    - set_fact:
        prod_ip_addr: "{{ item }}"
      when: "item | ipaddr('192.168.10.0/24')"
      with_items: "{{ ansible_all_ipv4_addresses }}"
    - debug: var=prod_ip_addr
```

This is useful for example when you have a separate management network interface.

It's almost as easy as trying to explain what the script is doing in plain English.
