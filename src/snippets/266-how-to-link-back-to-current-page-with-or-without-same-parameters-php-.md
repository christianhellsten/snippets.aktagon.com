---
id: '266'
title: How to link back to current page with or without same parameters (PHP)
languages:
- php
tags:
---

```php
function link_back($blacklist = array())
	{
		$parameters = split("&", $_SERVER['QUERY_STRING']);
		
		$uri = array_shift(split("\?", $_SERVER['REQUEST_URI']));

		$index = 0;
		
		foreach($parameters as $parameter)
		{
			$parameter = split("=", $parameter);
			
			$name = $parameter[0];
			$value = $parameter[1];
			
			if(in_array($name, $blacklist))
			{
				unset($parameters[$index]);
			}
			
			$index++;
		}
		
		if(count($parameters) > 0)
		{
			$parameters = "?".join("&", $parameters);	
		}
		else
		{
			$parameters = '';
		}
		
		return $uri.$parameters;
	}
```
    

Usage:


```php
# URI is /wow_amazing_code?not_wanted=23&wanted=1

echo link_back(array('not_wanted')); # prints out /wow_amazing_code?wanted=1
```
    

