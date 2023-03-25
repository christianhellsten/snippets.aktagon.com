---
id: '375'
title: nginx, fastcgi and wordpress
languages:
- bash
tags:
---
Some pitfalls I ran into.

CSS is served up as text/html by fastcgi to nginx. Determine this by turning on "Net" in [Firebug](http://getfirebug.com). Firefox in it's standard compliance isn't able to view the style sheet and therefore any images that may be defined in it. Solution; Serve up static stuff as static stuff through nginx:


```bash
server {
        # ... abbreviated
            location ~* ^.+\.(jpg|jpeg|gif|png|ico|css|zip|tgz|gz|rar|bz2|doc|xls|exe|pdf|ppt|txt|tar|mid|midi|wav|bmp|rtf|js|mov)$ {
                    root /home/wordpress/wordpress;
            }
        # ... abbreviated
    }
```
    

You receive the error "The plain HTTP request was sent to HTTPS port". Solution: Turn on HTTPS in fastcgi by sending the follwing parameter to it in nginx.conf.


```bash
server {
        # ... abbreviated
            location / {
                    # ... abbreviated
                    fastcgi_param HTTPS on;
                    # ... abbreviated
            }
        # ... abbreviated
    }
```
    

You get the FTP dialogue when trying to upload a new theme. Solution: Check that the process which runs fastcgi has write privileges into the wordpress folder.

