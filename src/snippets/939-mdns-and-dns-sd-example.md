---
id: '939'
title: mDNS and DNS-SD example
languages:
- bash
tags:
---
To advertise the existence of an HTTP service with mDNS, use:

```bash
dns-sd -R "Service X" _http._tcp . 80 path=/
```

To find the HTTP services on the local network, run:

```bash
dns-sd -B _http._tcp

Browsing for _http._tcp
DATE: ---Wed 03 Mar 2021---
17:48:45.207  ...STARTING...
Timestamp     A/R    Flags  if Domain               Service Type         Instance Name
17:48:45.207  Add        2   9 local.               _http._tcp.          Service X
```

See /etc/services for a list of valid services.
