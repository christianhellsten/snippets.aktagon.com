---
id: '310'
title: Positioning an element over another element with jQuery
languages:
- javascript
tags:
---
Positioning an element over another element is a common problem and can be used for creating simple tooltips, inline dialogs, informational messages and so on.

The code is simple:


```javascript
$.fn.positionOn = function(element, align) {
  return this.each(function() {
    var target   = $(this);
    var position = element.position();

    var x      = position.left; 
    var y      = position.top;

    if(align == 'right') {
      x -= (target.outerWidth() - element.outerWidth());
    } else if(align == 'center') {
      x -= target.outerWidth() / 2 - element.outerWidth() / 2;
    }

    target.css({
      position: 'absolute',
      zIndex:   5000,
      top:      y, 
      left:     x
    });
  });
};
```
    

Usage:


```javascript
$('selector-for-elements-to-position').positionOn($('selector-for-element-to-position-them-on'))
```
    

Normally you would use this code within an event listener such as mouseover or click:


```javascript
$(".add-link").live('click', function(event) {
      var target = $(this);
      var dialog = $('#add-link-dialog');

      dialog.positionOn(target, 'center');
      dialog.show();

      return false;
    });
```
    

More examples:


```javascript
# Default is align with top left corner of given element
$('#add-link-dialog').positionOn($('.add-link'))
# But you can align to the right and center
$('#add-link-dialog').positionOn($('.add-link'), 'right')
$('#add-link-dialog').positionOn($('.add-link'), 'center')
```
    

You'll need the jQuery dimensions plugin for this to work.

