---
id: '556'
title: How to create a custom userstyle/stylesheet with GreaseMonkey
languages:
- javascript
tags:
---
Version 1: Using GM\_getResourceText
------------------------------------


```javascript
// ==UserScript==
// @name	A name
// Our namespace
// @namespace	xxx.xxx
// Only run on this domain:
// @include       http://google.com/*
// The CSS file, use file:/// for local CSS files.
// @resource 	customCSS	https://raw.github.com/gist/xxx/xxx/xxx.css
// ==/UserScript==
//
//  Firebug logging is available...
console.debug('start: add CSS');
var cssTxt  = GM_getResourceText("customCSS");
GM_addStyle (cssTxt);
console.debug('done: add CSS');
```
    

Version 2: Using GM\_xmlhttpRequest
-----------------------------------


```javascript
// ==UserScript==
// @name           snippets
// @namespace      https://snippets.aktagon.com/
// @include        https://snippets.aktagon.com/*
// @include        https://aktagon.com/*
// ==/UserScript==
console.debug('start: add CSS');
GM_xmlhttpRequest({
  method: "GET",
  url: "http://localhost/aktagon/style.css?" + Math.random(),
  onload: function(response) {
    var css = response.responseText;
    GM_addStyle(css);
    console.debug('done: add ' + css);
  }
});
```
    

