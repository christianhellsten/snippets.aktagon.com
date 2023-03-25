---
id: '252'
title: How to convert a string to a timestamp and then back to a string with PHP
languages:
- php
tags:
- encryption
- eu
- gdpr
- masking
- pseudonymization
---

```php
$r = date_parse("8:16:12 01.02.2008");
$d = mktime($r['hour'], $r['minute'], $r['second'], $r['month'], $r['day'], $r['year']);
echo date("H:i:s d.m.Y", $d);
```
    

Prints out the following:


```php
8:16:12 01.02.2008
```
    

