---
id: '490'
title: How to add and remove validation rules (jQuery validate plugin)
languages:
- javascript
tags:
---
This snippet shows how to change the [jQuery validation](http://jquery.bassistance.de/validate/demo/milk/) plugin's validation rules dynamically:


```javascript
$(document).ready(function() { 
  // Setup the default validation rules
  var validator = $('form').validate({ 
    rules: { 
      username: { 
        required: true, 
        minlength: 2
      }
    }
  };

  // Drop-down selection changes validation rules
  $('#account-type').change(function () {
    // Get the jQuery validation plugin's settings
    var settings = $('form').validate().settings;

    // Modify validation settings
    $.extend(true, settings, {
       rules: {
           // Add validation of year
           "year": {
               required: true,
               min: 2010,
               max: 2020,
               number: true
           }, 
           // Remove validation of username
           "username": {} 
       }
    });
  });
});
```
    

You can also use CSS classes to achieve the same:


```javascript
$('#channel-title').addClass("{required:true,messages:{required:'required field'}}")
$('#channel-title').removeClass("{required:true,messages:{required:'required field'}}")
```
    

