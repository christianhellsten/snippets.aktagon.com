---
id: '396'
title: How to keep the scope when calling setTimeout/setInterval in JavaScript
languages:
- javascript
tags:
- execjs
- javascript
- ruby
- therubyracer
---

```javascript
// Don't loose our scope
var self = this;
// Closures to the rescue
setTimeout(function() { self.hide() }, 500);
```
    

