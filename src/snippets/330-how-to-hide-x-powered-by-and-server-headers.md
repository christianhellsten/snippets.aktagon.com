---
id: '330'
title: How to hide X-Powered-By and Server headers
languages:
- apacheconf
tags:
- digitalocean
- kubernetes
---
First enable the mod\_headers module:


```apacheconf
sudo a2enmod headers
```
    

Then add this to your apache2.conf:


```apacheconf
# Hide X-Powered-By and Server headers
Header always unset "X-Powered-By"
ServerTokens Prod
ServerSignature Off
```
    

Now restart Apache:


```apacheconf
/etc/init.d/apache2 force-reload
```
    

This is security through obscurity at it's finest...

