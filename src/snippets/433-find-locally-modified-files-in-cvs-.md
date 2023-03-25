---
id: '433'
title: Find locally modified files in CVS.
languages:
- bash
tags:
- cron
- failure
- notification
- slack
---
CVS prints it's output to stderr for some reason. Here's how to find locally modified files.


```bash
cvs up 2>1|grep ^M
```
    

