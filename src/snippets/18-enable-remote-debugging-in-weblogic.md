---
id: '18'
title: Enable remote debugging in weblogic
languages:
- bash
tags:
- deprecated
- ruby
---
Sometimes it's necessary to debug because you can't write a test for it (e.g a legacy system). Just add the following parameters to the server startup and connect your preferred debugger into port 1044 (or whatever you choose the port to be). Works in weblogic, but should work in JBoss and other java based application servers too.


```bash
-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=1044
```
    

