---
id: '754'
title: How to fix "Permission denied (publickey)." Ansible and "git clone" issue
languages:
- bash
tags:
---
If you have a "git clone" command like this in Ansible:


```bash
- name: Update code
  git: >
    repo={{ git_url }}
    dest={{ this_release_path }}
    version={{ git_version }}
    accept_hostkey=yes
  register: git
```
    

And the playbook is set to use sudo for all commands.

And you get this error:


```bash
stderr: Cloning into 'jeb-bush'...
Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

FATAL: all hosts have already failed -- aborting
```
    

It could be that you need to add "sudo: no" to the task.


```bash
- name: Update code
  sudo: no
  git: >
    repo={{ git_url }}
    dest={{ this_release_path }}
    version={{ git_version }}
    accept_hostkey=yes
  register: git
```
    

