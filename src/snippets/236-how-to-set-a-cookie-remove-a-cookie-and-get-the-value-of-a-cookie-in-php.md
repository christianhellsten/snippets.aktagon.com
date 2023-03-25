---
id: '236'
title: How to set a cookie, remove a cookie and get the value of a cookie in PHP
languages:
- php
tags:
- clipboard
- copy
- javascript
---
PHP cookie management is a good example of how incredibly badly designed PHP is:

Set a cookie that expires when browser is closed
------------------------------------------------

Note that you most probably want to set the path, which we do here:


```php
$value = 0;
$expires = 0;
setcookie('cookie_name', $value, $expires, '/');
```
    

Remove cookie
-------------


```php
setcookie ('cookie_name', FALSE, time()-10000);
```
    

Get cookie value
----------------


```php
$_COOKIE['cookie_name']
```
    

