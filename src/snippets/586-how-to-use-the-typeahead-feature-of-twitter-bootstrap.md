---
id: '586'
title: How to use the typeahead feature of Twitter Bootstrap
languages:
- javascript
tags:
---
Example of using the typeahead feature of Twitter Bootstrap:


```javascript
$('#search input').typeahead({
      source: ['one', 'two'],
      updater: function(item) {
        $('#search').submit();
        return item;
      }
});
```
    

Note that the form is submitted after an item is selected from the menu.

