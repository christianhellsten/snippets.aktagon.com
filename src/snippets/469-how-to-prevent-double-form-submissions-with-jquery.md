---
id: '469'
title: How to prevent double form submissions with jQuery
languages:
- javascript
tags:
---
This snippet will disable the submit button after the user clicks on it:


```javascript
$('form').submit(function(){
    var $button = $('input[type=submit]', this);
    $button.attr('disabled', 'disabled');
    $button.attr('value', $button.attr('value') + "...");
});
```
    

For Ajax forms, you need to enable the button again in your code.

