---
id: '484'
title: How to prevent hotlinking of images with nginx
languages:
tags:
---

```
# Alternative 1: location ~* (\.jpg|\.png|\.css|\.gif)$ {
# Alternative 2:
location /images/ {
    root /var/www/xxx/current/public;
    valid_referers none blocked xxx.com www.xxx.com;
    if ($invalid_referer) {
        return 444; # or 403 Forbidden
    }
}
```
    

