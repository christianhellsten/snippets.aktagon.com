---
id: '493'
title: 'How to store form data in a cookie with jQuery and the cookie plugin '
languages:
- javascript
tags:
---

```javascript
/**
 * Makes form data persistent by storing the data in cookies.
 */
(function($){
  /**
   * Load value from cookie, and set cookie when value is changed.
   */
  $.fn.persist = function(namespace) {
    if(!namespace) {
      namespace = "";
    }
    return this.each(function() {
      var $this = $(this);
      var id = $this.attr('id');
      var cookie_name = namespace + id;
      var value;

      // Store changes in a cookie
      $this.change(function() {
        $.cookie(cookie_name, $this.val());
      });

      value = $.cookie(id);
      // Don't overwrite value if it's set
      if(!$this.val()) {
        $this.val(namespace + value);
      }
    });
  };
})(jQuery); 

$(document).ready(function(){
  $('.persistent').persist();
});
```
    

