---
id: '220'
title: Awstats LogFormat configuration for nginx LogFormat
languages:
tags:
---
This is my nginx LogFormat configuration:


```
log_format main '$remote_addr - $remote_user [$time_local] $status '
                    '"$request" $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "http_x_forwarded_for"';
```
    

And this is my Awstats LogFormat configuration:


```
LogFormat = "%host - %host_r %time1 %code %methodurl %bytesd %refererquot %uaquot %otherquot"
```
    

