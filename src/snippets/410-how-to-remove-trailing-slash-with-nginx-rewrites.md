---
id: '410'
title: How to remove trailing slash with nginx rewrites
languages:
tags:
---

```
# Remove trailing slash by doing a 301 redirect
rewrite ^/(.*)/$ /$1 permanent;
```
    

