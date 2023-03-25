---
id: '126'
title: How to cache PHP objects to disk with CakePHP
languages:
- php
tags:
---
CakePHP has a view cache (similar to Rails) that can be used to cache objects. The following snippet shows a CakePHP action that uses the serialize and unserialize functions to cache a tag cloud-- an array containing tags in this case--to disk, and then read it back.

Note that we assign a TTL of 1 hours to the tag cloud, so if it's more than one hour old it will be refreshed from the database.


```php
function index()
	{
		$maximum = 100;
		$cache_key = "tag_cloud_$maximum";
		$tag_cloud = cache($cache_key, null, '+1 hours');
		
		if(empty($tag_cloud))
		{
			$tag_cloud = Tag::generate_cloud($maximum);
			cache($cache_key, serialize($tag_cloud));
		}
		else
		{
			$tag_cloud = unserialize($tag_cloud);
		}
		
		return $tag_cloud;
	}
```
    

The cache function is defined in $APP\_ROOT/cake/basics.php, which is where you should look if you want to know more about how the caching works...

