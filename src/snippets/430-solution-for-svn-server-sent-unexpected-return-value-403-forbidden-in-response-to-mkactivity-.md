---
id: '430'
title: 'Solution for "svn: Server sent unexpected return value (403 Forbidden) in
  response to MKACTIVITY"'
languages:
- bash
tags:
- github
- gitlab
- golang
---
Problem:


```bash
$ svn commit -m 'xxx'
svn: Commit failed (details follow):
svn: Server sent unexpected return value (403 Forbidden) in response to MKACTIVITY request for '/svn/xxx
```
    

The solution is to specify the username:


```bash
$ svn commit -m 'xxx' --username <login>
```
    

