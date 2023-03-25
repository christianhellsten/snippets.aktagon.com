---
id: '574'
title: User script for Quora
languages:
- javascript
tags:
- postgresql
- subtransaction
- transaction
---

```javascript
// ==UserScript==
// @name       Quora Deblur
// @namespace  http://quora.com/
// @version    0.1
// @description  Deblur
// @match      http://www.quora.com/*
// @copyright  2012+, You, me, the internet
// ==/UserScript==

function getEl (s, a) { return document["querySelector"+(a?"All":"")](s) }
function removeNode (n) { n.parentNode.removeChild(n) }
var forEach = Array.prototype.forEach;

removeNode(getEl(".signup_cta_on_answer"));
forEach.call(getEl(".text_hider", true), removeNode);
forEach.call(getEl(".blurred_answer", true), function(el) {
    el.className = el.className.replace("blurred_answer", "");
});
```
    

