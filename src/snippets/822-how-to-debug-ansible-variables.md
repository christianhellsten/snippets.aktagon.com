---
id: '822'
title: How to debug Ansible variables
languages:
- bash
- yaml
tags:
---
Print all variables for all hosts from the command line:

```bash
 $ ansible -i inventory/local -m debug -a "var=hostvars" all
```

Replace hostvars with any of the following to print:
- ansible_locals
- groups
- group_names
- environment
- vars
- ansible_sucks

Print all variables for all hosts from a playbook:
```yaml
- hosts: all
  tasks:
    -  debug:
        var: hostvars[inventory_hostname]
        # -vvv to debug !!!!
        # verbosity: 4
```

Print all variables:
```yaml
- name: print ansible_local
  debug: var=ansible_local
```
