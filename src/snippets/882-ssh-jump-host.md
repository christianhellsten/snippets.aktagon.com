---
id: '882'
title: SSH jump host
languages:
- bash
tags:
---
```bash
# Connect to server-b by going through server-a (you => server-a => server-b):
$ ssh -t <user>@<server-a> ssh <server-b>
```
