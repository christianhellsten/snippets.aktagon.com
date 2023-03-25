---
id: '328'
title: 'How to fix "fatal: ''gitosis-admin.git'': unable to chdir or not a git archive"'
languages:
- bash
tags:
---
Are the SSH keys valid?
-----------------------

When, not if, you get this error you most probably have the wrong keys listed in /home/git/.ssh/authorized\_keys:


```bash
$ git  clone git@xxx.com:gitosis-admin.git 
Initialized empty Git repository in /Users/christian/Documents/Projects/gitosis-admin/.git/
fatal: 'gitosis-admin.git': unable to chdir or not a git archive
fatal: The remote end hung up unexpectedly
```
    

Try removing the keys in authorized\_keys one by one, and verify that the names of the users match the ones in .gitosis.conf

<http://scie.nti.st/2007/11/14/hosting-git-repositories-the-easy-and-secure-way>

Try using the full path to the repository
-----------------------------------------


```bash
$ git clone git@xxx.com::/home/git/repositories/xxx.git
```
    

Check if the repository exists
------------------------------


```bash
$ cd /home/git/repositories/xxx.git
```
    


```bash
$ git clone /home/git/repositories/xxx.git
```
    

What does SSH say?
------------------


```bash
ssh -v git@xxx.com
```
    

Use Google
----------

http://stackoverflow.com/questions/1264262/connecting-to-gitosis-server-through-an-ssh-tunnel
http://stackoverflow.com/questions/733057/can-git-work-via-ssh-port-forwarding

