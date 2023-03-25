---
id: '71'
title: Multiple IP addresses on a Xen VM
languages:
- bash
tags:
- distinct
- latest
- partition
- postgres
- top
- window
---
Xen VM's support up to three IP addresses. Just give them as parameters when you create the image. There will be one interface within the Xen and the other IP's are mapped to interface aliases.


```bash
xen-create-image ... --ip=10.0.0.44 --ip=10.0.0.45 ...
```
    

