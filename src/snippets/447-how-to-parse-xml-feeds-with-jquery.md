---
id: '447'
title: How to parse XML feeds with jQuery
languages:
- javascript
tags:
- '"jump host"'
- rsync
- scp
- ssh
---

```javascript
$.ajax({
	type: 'GET',
	url: '/some/good/stuff.xml',
	dataType: 'xml',
	error: function(xhr) {
		alert('Failed to parse feed');
	},
	success: function(xml) {
		var channel = $('channel', xml).eq(0);
		var items = [];
		$('item', xml).each( function() {
			var item = {};
			item.title = $(this).find('title').eq(0).text();
			item.link = $(this).find('link').eq(0).text();
			item.description = $(this).find('description').eq(0).text();
			item.updated = $(this).find('pubDate').eq(0).text();
			item.id = $(this).find('guid').eq(0).text();
			items.push(item);
		});
		console.dir(items);
	}
});
```
    

Your friend Internet Explorer
-----------------------------

For IE 6 and better (worse?) the feed must return the right content type, so make sure the response contains this header:


```javascript
Content-type: text/xml
```
    

If this header is not set the jQuery Ajax error handler is called and the feed is not parsed.

