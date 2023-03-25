---
id: '116'
title: How to add logging to CakePHP applications
languages:
- php
tags:
---
Note that Pear's Logging package is a lot more flexible, so I recommend you use that instead of CakePHP's built-in logging.

Use this code to add a debug message to the CakePHP debug log:


```php
$this->log("Upload action accessed", LOG_DEBUG);
```
    

Note that using something other than LOG\_DEBUG will log the message as an error.

Run the code once and you should be able to see the message in $CAKE\_APP/tmp/logs/debug.log.

