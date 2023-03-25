---
id: '10'
title: Disable pc speaker beep in Linux
languages:
- bash
tags:
- go
- modules
---
Not really a snippet, still a good fix for a big annoyance. Temporarily disable the speaker by removing the driver for it.


```bash
sudo rmmod pcspkr
```
    

To make the silence more permanent add this line into <b>/etc/modprob.d/blacklist</b>


```bash
blacklist pcspkr
```
    

