---
id: '905'
title: '"netstat | grep LISTEN" for MacOS'
languages:
- bash
tags:
---
Add this alias to your shell to get the equivalent output of running "netstat | grep LISTEN" on Linux:

```bash
alias netstat-listen='lsof -iTCP -sTCP:LISTEN'
```
