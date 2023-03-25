---
id: '499'
title: How to create a Linux swap image
languages:
- bash
tags:
- etree
- namespaces
- python
---
1024MB = 1024\*1024 = 1048576:


```bash
dd if=/dev/zero of=/tmp/swap.img bs=1024 count=1048576
mkswap /tmp/swap.img
```
    

