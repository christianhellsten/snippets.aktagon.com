---
id: '389'
title: How to set the Expires header with Apache 2 and mod_expires
languages:
- apacheconf
tags:
---
First you need to enable the mod\_expires module:


```apacheconf
a2enmod expires
```
    

Next add this to your configuration:


```apacheconf
ExpiresActive On
# Set Expires header to current time by default
ExpiresDefault A0

<FilesMatch "\.(flv|ico|pdf|avi|mov|ppt|doc|mp3|wmv|wav)$">
  ExpiresDefault "access plus 30 days"
</FilesMatch>

<FilesMatch "\.(jpg|jpeg|png|gif|swf|bmp|)$">
  ExpiresDefault "access plus 7 days"
</FilesMatch>

<FilesMatch "\.(txt|xml|js|css)$">
  ExpiresDefault "access plus 1 day"
</FilesMatch>
```
    

Now restart Apache:


```apacheconf
$ sudo /etc/init.d/apache2 force-reload
```
    

Check that the proper headers are set with Firebug, Yahoo YSlow or Google Page speed.

