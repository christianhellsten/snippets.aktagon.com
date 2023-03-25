---
id: '782'
title: How to find out which firewall is blocking a request
languages:
- bash
tags:
---
How to trace an outgoing connection to https://x.com:
```bash
hping3 --traceroute -V -S -p 443 -s 5050 x.com
```

http://0daysecurity.com/articles/hping3_examples.html
