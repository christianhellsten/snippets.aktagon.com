---
id: '35'
title: Remote X11 apps through SSH
languages:
- bash
tags:
- delegate
- form
- pattern
- rails
- validations
---
In order to forward X11 applications from a remote server into your local X session the server must support tunneling of X11 apps with this property in sshd\_config


```bash
X11Forwarding yes
```
    

Then simply issue the -X parameter for the SSH client.


```bash
ssh -X remotehost
```
    

Now run an X11 application from the SSH terminal and it's UI will be tunneled to your local X session.


```bash
gvim my_script.rb
```
    

