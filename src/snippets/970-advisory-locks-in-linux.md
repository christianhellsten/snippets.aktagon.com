---
id: '970'
title: Advisory locks in Linux
languages:
- bash
tags:
---
Use Linux advisory locks to prevent concurrent execution of scripts:

```bash
flock -nx /var/lock/scriptx scriptx.sh
```
