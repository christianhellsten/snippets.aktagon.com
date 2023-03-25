---
id: '650'
title: Show CPU hogs on OSX
languages:
- bash
tags:
---

```bash
ps -eo pcpu,pid,user,args | sort -k1 -r | head -10
```
    

