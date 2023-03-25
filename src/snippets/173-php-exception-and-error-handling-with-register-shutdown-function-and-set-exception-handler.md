---
id: '173'
title: PHP exception and error handling with register_shutdown_function and set_exception_handler
languages:
- php
tags:
- debugging
- dstat
- dtrace
- dtruss
- netcat
- netstat
- ngrep
- perf
- strace
- tcpdump
- wireshark
---
PHP has the crappiest error handling I've ever seen. The default behavior is to show all error messages to the user. If you disable this then you get a blank screen instead. The trick is to register an error handler with register\_shutdown\_function, which is then called if for example memory is exhausted. You could perhaps also use an ErrorDocument 500, but that didn't work for me.

Here's the code I've used to handle both application exceptions and errors, such as memory limit exceeded. The trick is to have a global variable that indicates whether the script was run successfully or not. Add your code here: "Insert your buggy code here".


```php
$no_errors_detected = false;

class DispatchErrors 
{
	static function handleException($exception) 
	{
	  Logging::error($message);

		header( 'Location: /error500.html' );
	}
	
	static function handleShutdown()
	{
		global $no_errors_detected;
		
		if (!$no_errors_detected)
		{
			header( 'Location: /error500.html' );
		}		
	}
}

register_shutdown_function(array('DispatchErrors', 'handleShutdown'));
set_exception_handler(array('DispatchErrors', 'handleException'));

# handleShutdown will be called
#range(0, 10000000000000000000);

# handleException will be called
#throw new Exception("abcd");

# Insert your buggy code here

$no_errors_detected = true;
```
    

