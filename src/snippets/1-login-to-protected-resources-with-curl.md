---
id: '1'
title: Login to protected resources with curl
languages:
- bash
tags:
---
Cookies are stored and retrieved from cookies.txt. Post data is set using the **data** switch:


```bash
curl --cookie cookies.txt --cookie-jar cookies.txt --user-agent Mozilla/4.0 --data "user=xxxxx&password=xxxxx" http://www.com/login -v
curl --cookie cookies.txt --user-agent Mozilla/4.0 http://www.com/protected/resource
```
    

