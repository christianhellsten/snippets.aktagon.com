---
id: '906'
title: '"ipaddr show" for MacOS'
languages:
- bash
tags:
---
```bash
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ipaddr='wanip && ipconfig getifaddr en1'
```
