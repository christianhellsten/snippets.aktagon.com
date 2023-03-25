---
id: '457'
title: 'How to build popup menus and tooltips with jQuery  '
languages:
- javascript
tags:
- listen
- macos
- netstat
- osx
---
This snippet shows you how to build a simple popup menu with jQuery. The example code can also be used to build things such as tooltips.

In the example we're going to build a menu for deleting table rows.

The HTML:


```javascript
<table id="data">
  <tr>
    <td>
      <a href='/domains/digg.com'>digg.com</a>
      <!-- menu start -->
      <span class='hover-menu'>
        <a href='/domains/digg.com/remove' class='remove'>remove</a>
      </span>
      <!-- menu end -->
    </td>
  </tr>
</table>
```
    

The CSS:


```javascript
.hover-menu
  display: none
```
    

The Javascript:


```javascript
$.event.special.hover.delay = 200; 
$.event.special.hover.speed = 200; 

var show = function(e) {
  var $this = $(this);
  var $tooltip = $this.find('.hover-menu');
  $tooltip.fadeIn();
}

var hide = function() {
  var $this = $(this);
  var $tooltip = $this.find('.hover-menu');
  $tooltip.fadeOut();
}
$('#data td').bind('hover', show);
$('#data td').bind('hoverend', hide);
```
    

When you hover your mouse over table rows the menu will be shown.

You'll need to install [the Event hover jQuery plugin](http://blog.threedubmedia.com/2008/08/eventspecialhover.html) to be able to use the hover and hoverend events. You could replace them with mouseenter and mouseleave, but usability would suffer...

