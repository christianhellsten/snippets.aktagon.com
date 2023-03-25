---
id: '608'
title: Fix disconnecting 3g connection using ssh.
languages:
- bash
tags:
- backup
- gpg
- tar
---
In crowded areas my 3g connection tends to drop. I fixed it by connecting to an outside server using the parameter below. Now ssh is keeping my 3g connection alive by polling the server with one second intervals. The while loop could also be done using [autossh](http://www.harding.motd.ca/autossh/)


```bash
while true; do ssh -o ServerAliveInterval=1 -l marko some.outside.server.tld; done
```
    

