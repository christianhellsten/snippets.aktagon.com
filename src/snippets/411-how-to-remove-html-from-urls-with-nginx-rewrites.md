---
id: '411'
title: How to remove .html from URLs with nginx rewrites
languages:
- bash
tags:
---
This will rewrite http://xxx.com/porn to http://xxx.com/porn.html for added pleasure:


```bash
location / {
        # break if URI has .html extension
        if ($request_filename ~* ^.+.html$) {
          break;
        }
        # add .html to URI and serve file, directory, or symlink if it exists
        if (-e $request_filename.html) {
          rewrite ^/(.*)$ /$1.html last;
          break;
        }
      }
```
    

This URL will also work http://xxx.com/porn/

