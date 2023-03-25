---
id: '956'
title: Forward proxy with rate limiting
languages:
tags:
---
Option 1: haproxy in front of squid or varnish

Option 2: write a proxy in Golang

See https://github.com/elazarl/goproxy/

Option n: write a proxy in x

You could also use socat (ispeed/ospeed switches) and pipes:
http://www.dest-unreach.org/socat/doc/README
