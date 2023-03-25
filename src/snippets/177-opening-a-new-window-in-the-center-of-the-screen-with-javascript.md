---
id: '177'
title: Opening a new window in the center of the screen with JavaScript
languages:
- javascript
tags:
---
This JavaScript code will open a URL in a new window and center the window on the screen, instead of showing the window in a random place:


```javascript
var url = 'http://google.com/';
var width  = 640;
var height = 480;
   
var left   = (screen.width / 2) - (width / 2);
var top    = (screen.height / 2) - (height / 2);
   
var xWindow = window.open(url, 'post', 'resizable=1,width=' + width + ',height=' + height + ', top=' + top + ', left=' + left);

xWindow.focus();
```
    

