---
id: '232'
title: How to debug memory allocation problems in PHP with Xdebug
languages:
- php
tags:
---
Xdebug is a good tool for finding the root cause of memory allocation problems such as the one shown here:


```php
Fatal error: Allowed memory size of X bytes exhausted (tried to allocate X bytes)
```
    

First install Xdebug by following [the Xdebug installation instructions](http://xdebug.org/docs/install).

Next surround the code you suspect is causing the problem with the following function calls:


```php
xdebug_start_trace('/tmp/mytrace');
...
Bad bad PHP code
...
xdebug_stop_trace();
```
    

[Read this blog entry by splitbrain.org for more details](http://www.splitbrain.org/blog/2008-02/21-understanding_php_code_better_with_xdebug)

