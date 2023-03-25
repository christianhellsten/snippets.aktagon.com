---
id: '49'
title: Solution to the "Terminal too wide" problem
languages:
- bash
tags:
- apache
- '"forward proxy"'
- haproxy
- proxy
---
On Solaris you sometimes get this error when firing up your VI editor:


```bash
Terminal too wide
```
    

One solution is to increase the number of the columns with this command:


```bash
stty columns 120
```
    

An even better solution is to install VIM...

