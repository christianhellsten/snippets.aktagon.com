---
id: '217'
title: Opening external links in a new window with jQuery and "rel=external"
languages:
- javascript
tags:
---
Usually you would do this with target='blank', but that attribute has been removed, so use this instead:


```javascript
$('a[rel=external]').click(function() {
	window.open(this.href); 
	return false;
});
```
    

