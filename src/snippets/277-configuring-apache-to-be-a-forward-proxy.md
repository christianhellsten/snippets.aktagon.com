---
id: '277'
title: Configuring Apache to be a forward proxy
languages:
- apacheconf
tags:
---
First enable the proxy and proxy\_http modules:


```apacheconf
sudo a2enmod proxy
sudo a2enmod proxy_http
```
    

Then use this configuration to make Apache act as an HTTP proxy:


```apacheconf
<VirtualHost *:8080>
# Enable forward proxy
ProxyRequests On
# Add "Via" header
ProxyVia On
#ProxyRemote * http://...:8080 Uncomment to route requests through another proxy

<Proxy *>
  	Order deny,allow
	  Deny from all
  # Allow access only from local network
  Allow from 192.168.1
</Proxy> 
	
# Enable caching proxy
CacheRoot "/tmp"
CacheMaxExpire 24
CacheLastModifiedFactor 0.1
CacheDefaultExpire 1

ServerName my-proxy

ErrorLog "/var/log/apache2/proxy-error.log"
CustomLog "/var/log/apache2/proxy-access.log" common
</VirtualHost>
```
    

Also read [this](http://httpd.apache.org/docs/2.0/mod/mod_proxy.html#access).

Tips
----

You can use mod\_rewrite to rewrite requests. To rewrite root (/) to /temporary\_outage you could use the following rewrite:


```apacheconf
RewriteCond %{HTTP_HOST} ^(www\.)?xxx\.com 
RewriteRule /$ http://%{HTTP_HOST}/temporary_outage/ [P,L]
```
    

