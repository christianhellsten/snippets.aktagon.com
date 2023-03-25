---
id: '501'
title: Migrating ERB to HAML with VIM
languages:
tags:
---
This search-and-replace snippet helps a bit:


```
:%s/<\(\w[^>]*\)>/%\1/gc
```
    

