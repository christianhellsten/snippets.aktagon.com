---
id: '12'
title: SSH tunneling
languages:
- bash
tags:
- at-least-once
- at-most-once
- checklist
- order
- sidekiq
- worker
---
SSH tunneling to bypass overly strict firewalls for services you need. The first port is that of the remote service, and the latter is the port you want to use on the local computer. For clarity I usually use the same port on both computers if possible. Here we initiate a tunnel into the vnc server of a remote host.


```bash
ssh -L 5905:localhost:5905 marko@remotehost
```
    

Next we open the vnc viewer into localhost, which in fact is the tunnel into the remote host.


```bash
vncviewer localhost:5
```
    

