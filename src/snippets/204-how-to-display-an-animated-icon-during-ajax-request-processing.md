---
id: '204'
title: How to display an animated icon during Ajax request processing
languages:
- javascript
tags:
---
This example uses the jQuery JavaScript library.

First, create an Ajax icon using the [AjaxLoad site](http://www.ajaxload.info/).

Then add the following to your HTML:


```javascript
<img src="/images/loading.gif" id="loading-indicator" style="display:none" />
```
    

And the following to your CSS file:


```javascript
#loading-indicator {
  position: absolute;
  left: 10px;
  top: 10px;
}
```
    

Lastly, you need to hook into the [Ajax events](http://docs.jquery.com/Ajax_Events) that jQuery provides; one event handler for when the Ajax request begins, and one for when it ends:


```javascript
$(document).ajaxSend(function(event, request, settings) {
  $('#loading-indicator').show();
});

$(document).ajaxComplete(function(event, request, settings) {
  $('#loading-indicator').hide();
});
```
    

