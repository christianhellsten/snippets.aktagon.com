---
id: '460'
title: jQuery cycle plugin
languages:
- javascript
tags:
- address
- ip
- ipaddr
---

```javascript
(function($){  
  $.fn.cycle = function() {
    $(this).each(function(index) {
      var cls = index % 2 ? 'even':'odd';
      $(this).attr('class', cls);
    });
  }
})(jQuery);
```
    

