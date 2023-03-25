---
id: '200'
title: Really simple hover menus with jQuery
languages:
- javascript
tags:
---
I got the inspiration for this simple menu from [this blog post](http://www.flairpair.com/blog/web-development/jquery-simple-menu-with-slide-in-effect). It's based on the [hover intent jQuery plugin](http://cherne.net/brian/resources/jquery.hoverIntent.html) by Brian Cherne.

The requirements:

### Hide menu on mouse out:

Categories

### Display menu on mouse over:

Categories

-Edit

-Delete

The HTML
--------


```javascript
<div id="categories-menu" class="hover-menu">
  <h2>Categories</h2>
  <ul class="actions no-style" style="display: none">
    <li><a href="">Add</a></li>
    <li><a href="">Edit</a></li>
    <li><a href="">Delete</a></li>
  </ul>
</div>
```
    

The JavaScript
--------------


```javascript
<script type="text/javascript">
$(document).ready(function() {

  function show() {
    var menu = $(this);
    menu.children(".actions").slideDown();
  }
 
  function hide() { 
    var menu = $(this);
    menu.children(".actions").slideUp();
  }

  $(".hover-menu").hoverIntent({
    sensitivity: 1, // number = sensitivity threshold (must be 1 or higher)
    interval: 50,   // number = milliseconds for onMouseOver polling interval
    over: show,     // function = onMouseOver callback (required)
    timeout: 300,   // number = milliseconds delay before onMouseOut
    out: hide       // function = onMouseOut callback (required)
  });
 
});
</script>
```
    

Positioning the hover menu over the content
-------------------------------------------

The above example will show the menu inline with the content, effectively pushing it down. To avoid that, use this HTML:


```javascript
<div id="categories-menu" class="hover-menu" style="position: relative">
  <h2>Categories</h2>
  <ul class="actions no-style" style="position: absolute; background: white; display: none;">
    <li><a href="" id="edit-mode">Edit mode</a></li>
    <li><a href="" class="last">Add</a></li>
  </ul>
</div>
```
    

hoverIntent alternative
-----------------------

See [this snippet](http://snippets.aktagon.com/snippets/457-How-to-build-context-menus-and-tooltips-with-jQuery-) for an alternative solution.

