---
id: '19'
title: Find out the process id of a process you know how to single out with grep.
languages:
- bash
tags:
---
The cut program can be really versatile. Give it the character used to separate columns using the -d switch, and the column(s) you want to print using the -f switch. Here we give ' ' as a parameter to the -d switch because spaces indicate the columns here. A single column is given using -fn and multiple columns using -fn,n,n,n,n syntax.


```bash
ps axu |grep FitNesse | grep java |grep -v grep | cut -d' ' -f3
```
    

