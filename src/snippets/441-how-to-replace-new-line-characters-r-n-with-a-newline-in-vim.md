---
id: '441'
title: How to replace new line characters \r\n with a newline in VIM
languages:
tags:
---
To get the ^M character, type CTRL+V and press enter:


```
:%s/\\r\\n/^M/g
```
    

