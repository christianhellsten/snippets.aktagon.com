---
id: '452'
title: How to trigger the Firebug debugger programatically
languages:
- javascript
tags:
---

```javascript
$('form').submit(function() {
    debugger; // This will open the Firebug debugger
    $.post(this.action, $(this).serialize(), null, "json");
    return false;
});
```
    

