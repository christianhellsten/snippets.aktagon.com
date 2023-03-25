---
id: '511'
title: Reverse ssh tunnel.
languages:
- bash
tags:
- dns
- dns-sd
- mdns
- '"service discovery"'
---
Don't want to run ssh service on the server? Then have the server create a tunnel into your computer and creep up to the server using that.


```bash
ssh -R 1234:localhost:22 marko@123.123.123.123
```
    

123.123.123.123 is the ip address of your computer. Then just do a ssh -l marko -p 1234 localhost on your computer to login to the server.

