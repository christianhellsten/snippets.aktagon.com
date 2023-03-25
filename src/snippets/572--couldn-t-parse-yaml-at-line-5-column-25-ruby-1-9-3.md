---
id: '572'
title: '"couldn''t parse YAML at line 5 column 25" + Ruby 1.9.3'
languages:
- apacheconf
tags:
- '"forward proxy"'
- haproxy
- '"rate limiting"'
- varnish
---
Change:


```apacheconf
rails:
  lol: something
```
    

To:


```apacheconf
rails:
  lol:something
```
    

