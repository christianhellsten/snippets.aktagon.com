---
id: '371'
title: How to use file_get_contents with a proxy
languages:
- php
tags:
- host
- jump
- ssh
---

```php
$url = 'http://www';

$proxy = 'tcp://xxx:8080';

$context = array(
	'http' => array(
		'proxy' => $proxy,
		'request_fulluri' => True,
		),
	);
	
$context = stream_context_create($context);

$body = file_get_contents($url, False, $context);
```
    

The code was found [here](http://fi2.php.net/file_get_contents). Note that it doesn't seem to work with HTTPS.

