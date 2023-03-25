---
id: '593'
title: 'Fixing RedHat issue "libstdc++.so.5: wrong ELF class: ELFCLASS32"'
languages:
- apacheconf
tags:
- '"request id"'
- rest
- safe
- thread-safety
---
Issue:


```apacheconf
libstdc++.so.5: wrong ELF class: ELFCLASS32
```
    

Fix:


```apacheconf
$sudo yum install compat-libstdc++-33.x86_64
```
    

