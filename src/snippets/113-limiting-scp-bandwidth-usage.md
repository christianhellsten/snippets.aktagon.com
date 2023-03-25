---
id: '113'
title: Limiting scp bandwidth usage
languages:
- bash
tags:
---
Use the -l parameter of scp to limit the speed of a file transfer (both upload or download). An empirically tested, good value for a 54Mbit wireless connection is 18000:


```bash
scp -l 18000 remotehost:file.img .
```
    

