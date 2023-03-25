---
id: '229'
title: Fixing how nginx sends request URI to the backend server.
languages:
- bash
tags:
- nmap
- security
- vulnerability
---
I needed to send an URI through [Nginx](http://wiki.codemongers.com/Main) to the backend servers ([Mongrel](http://mongrel.rubyforge.org/)) intact. However Nginx was constantly unescaping the URI, and removed slashes in the process. That resulted in an invalid URL at the backend server. The fix was **simple**, but extremely hard to find. Just remove the trailing slash from the *proxy\_pass* directive, like below.

Invalid URI is sent to the backend server with this configuration of Nginx.


```bash
proxy_pass         http://backend1:3000/;
```
    

Valid, untampered URI is sent with this configuration of Nginx.


```bash
proxy_pass         http://backend1:3000;
```
    

