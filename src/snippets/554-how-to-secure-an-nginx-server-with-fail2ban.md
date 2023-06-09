---
id: '554'
title: How to Secure an nginx Server with Fail2Ban
languages:
- apacheconf
tags:
- docker
- postgrest
---
Our Security Requirements
-------------------------

-   Block anyone trying to run scripts (.pl, .cgi, .exe, etc)
-   Block anyone trying to use the server as a proxy
-   Block anyone failing to authenticate using nginx basic authentication
-   Block anyone failing to authenticate using our application's log in page
-   Block bad bots
-   Limit the number of connections per session

We could use ModSecurity to support these requirements, but it's not compatible with nginx. We want a lightweight and easy-to-use solution. We can fulfill all these requirements with fail2ban and nginx.

Configuring Fail2ban
--------------------

All except the last requirement of connection throttling is supported by Fail2Ban. To start blocking unwanted guests, put this in Fail2Ban's jail.conf file:


```apacheconf
[nginx-auth]
enabled = true
filter = nginx-auth
action = iptables-multiport[name=NoAuthFailures, port="http,https"]
logpath = /var/log/nginx*/*error*.log
bantime = 600 # 10 minutes
maxretry = 6

[nginx-login]
enabled = true
filter = nginx-login
action = iptables-multiport[name=NoLoginFailures, port="http,https"]
logpath = /var/log/nginx*/*access*.log
bantime = 600 # 10 minutes
maxretry = 6
 
[nginx-badbots]
enabled  = true
filter = apache-badbots
action = iptables-multiport[name=BadBots, port="http,https"]
logpath = /var/log/nginx*/*access*.log
bantime = 86400 # 1 day
maxretry = 1
 
[nginx-noscript]
enabled = true
action = iptables-multiport[name=NoScript, port="http,https"]
filter = nginx-noscript
logpath = /var/log/nginx*/*access*.log
maxretry = 6
bantime  = 86400 # 1 day
 
[nginx-proxy]
enabled = true
action = iptables-multiport[name=NoProxy, port="http,https"]
filter = nginx-proxy
logpath = /var/log/nginx*/*access*.log
maxretry = 0
bantime  = 86400 # 1 day
```
    

Filter configuration
--------------------

The following filter configuration files are stored in /etc/fail2ban/filter.d/:


```apacheconf
# Proxy filter /etc/fail2ban/filter.d/nginx-proxy.conf:
#
# Block IPs trying to use server as proxy.
#
# Matches e.g.
# 192.168.1.1 - - "GET http://www.something.com/
#
[Definition]
failregex = ^<HOST> -.*GET http.*
ignoreregex =
 
# Noscript filter /etc/fail2ban/filter.d/nginx-noscript.conf:
#
# Block IPs trying to execute scripts such as .php, .pl, .exe and other funny scripts.
#
# Matches e.g.
# 192.168.1.1 - - "GET /something.php
#
[Definition]
failregex = ^<HOST> -.*GET.*(\.php|\.asp|\.exe|\.pl|\.cgi|\scgi)
ignoreregex =
 
#
# Auth filter /etc/fail2ban/filter.d/nginx-auth.conf:
#
# Blocks IPs that fail to authenticate using basic authentication
#
[Definition]
 
failregex = no user/password was provided for basic authentication.*client: <HOST>
            user .* was not found in.*client: <HOST>
            user .* password mismatch.*client: <HOST>
 
ignoreregex =
```
    


```apacheconf
#
# Login filter /etc/fail2ban/filter.d/nginx-login.conf:
#
# Blocks IPs that fail to authenticate using web application's log in page
#
# Scan access log for HTTP 200 + POST /sessions => failed log in
[Definition]
failregex = ^<HOST> -.*POST /sessions HTTP/1\.." 200
ignoreregex =
```
    

Testing fail2ban Rules
----------------------

You should test your fail2ban rules with the fail2ban-regex command:


```apacheconf
# Test against a log file
# fail2ban-regex <log file> <filter configuration>
fail2ban-regex /var/log/nginx/access.log /etc/fail2ban/filter.d/nginx-login.conf 

# Test using strings
# fail2ban-regex <e.g. row from log file> <failure regex from filter configuration>
fail2ban-regex "127.1.1.1 - - [21/Feb/2012:10:31:08 +0200] \"POST /sessions HTTP/1.1\" 200 1532 \"https://xxx.com/sessions\" \"Mozilla/5.0 Safari/535.11\" \"-\"" "^<HOST> -.*POST /sessions HTTP/1\..\" 200"
```
    

Limiting the number of connections
----------------------------------

We limit the number of connections to 2 per second and allow a burst of 50 with the following nginx configuration:


```apacheconf
http {
    limit_req_zone  $binary_remote_addr  zone=app:10m   rate=2r/s; 
    ... 
    server {
         ... 
        location / {
            limit_req   zone=app burst=50;
        }
```
    

Note that you could also use [Rack::Attack](https://github.com/kickstarter/rack-attack) to implement many of these requirements.

References
----------

<http://wiki.nginx.org/HttpLimitReqModule>
<http://www.fail2ban.org/wiki/index.php/Main_Page>
[http://serverfault.com/questions/307575/fail2ban-doesnt-process-jail-even-though-regex-matches](http://www.fail2ban.org/wiki/index.php/Main_Page)

