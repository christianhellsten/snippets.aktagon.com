---
id: '296'
title: DELETE, PUT, GET and POST with jQuery
languages:
- javascript
tags:
---
Example of how to do DELETE, PUT, GET and POST with jQuery and Rails REST type routing:


```javascript
$.ajax({ 
	type: 'get', 
	url: '/subscriptions/' + id,
	data: "subscription[title]=" + encodeURI(value),
	dataType: 'script' 
}); 

$.ajax({ 
	type: 'POST', 
	url: '/subscriptions/' + id,
	data: "subscription[title]=" + encodeURI(value),
	dataType: 'script' 
}); 

$.ajax({ 
	type: 'PUT', 
	url: '/subscriptions/' + id,
	data: "subscription[title]=" + encodeURI(value),
	dataType: 'script' 
}); 

$.ajax({
	type: 'DELETE',
	url: url,
	data: 'subscription[id]=' + id,
	dataType: 'script'
});
```
    

The gotcha with DELETE is to specify the ID using the data parameter, otherwise you might get this error; at least with Rails 2.2.2, jQuery 1.3.1, FF 3:


```javascript
/!\ FAILSAFE /!\  Mon Feb 16 13:57:52 +0200 2009
  Status: 500 Internal Server Error
  You have a nil object when you didn't expect it!
You might have expected an instance of ActiveRecord::Base.
The error occurred while evaluating nil.attributes
    /usr/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib/active_support/vendor/xml-simple-1.0.11/xmlsimple.rb:708:in get_attributes'
    /usr/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib/active_support/vendor/xml-simple-1.0.11/xmlsimple.rb:462:in collapse'
```
    

