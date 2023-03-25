---
id: '142'
title: How to execute a CakePHP controller's action from a cron job
languages:
- php
tags:
- deploy
- deployment
- distillery
- elixir
- exrm
- rollback
- upgrade
---
First copy webroot/index.php to **webroot/cron\_scheduler.php**. Replace everything below **require CORE\_PATH . 'cake' . DS . 'bootstrap.php';** with the following code:


```php
#
# BEGIN
#
# This was added to webroot/cron_scheduler.php
#

# Check that URI was specified and that we're called from the command line (not the web)
if($argc == 2 && php_sapi_name() === "cli") 
{
	# Set request URI
	$_SERVER['REQUEST_URI'] = $argv[1];
	# Set user-agent, so we can do custom processing
	$_SERVER['HTTP_USER_AGENT'] = 'cron';
	
	$Dispatcher= new Dispatcher();
	$Dispatcher->dispatch($argv[1]);
} 

#
# END
#
# 
#
```
    

Now you can execute CakePHP from the command line with the following command:


```php
$ php cron_scheduler.php /controller/action
```
    

If you get the following error, remove the lines containing line feeds in bootstrap.php:


```php
Warning: Cannot modify header information - headers already sent by (output started at .../app/config/b
ootstrap.php:48) in .../app/app_controller.php on line 46
```
    

