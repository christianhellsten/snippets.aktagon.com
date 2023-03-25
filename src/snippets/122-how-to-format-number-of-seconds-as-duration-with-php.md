---
id: '122'
title: How to format number of seconds as duration with PHP
languages:
- php
tags:
---
A very sophisticated algorithm that will display the length of, for example, a video as 12:01:30.


```php
function duration($seconds_count)
	{
		$delimiter  = ':';
		$seconds = $seconds_count % 60;
		$minutes = floor($seconds_count/60);
		$hours   = floor($seconds_count/3600);

		$seconds = str_pad($seconds, 2, "0", STR_PAD_LEFT);
		$minutes = str_pad($minutes, 2, "0", STR_PAD_LEFT).$delimiter;

		if($hours > 0)
		{
			$hours = str_pad($hours, 2, "0", STR_PAD_LEFT).$delimiter;
		}
		else
		{
			$hours = '';
		}

		return "$hours$minutes$seconds";
	}
```
    

