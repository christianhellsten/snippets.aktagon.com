---
id: '150'
title: 'Getting the state of checkboxes with jQuery '
languages:
- javascript
tags:
---
The following code will loop through all selected (checked) checkboxes and collect their values in an array:


```javascript
var selected = [];
$('#select-columns input[@type=checkbox]').filter(':checked').each(function () {
	selected.push(this.value);
});
console.log(selected);
```
    

More examples can be found [here](http://jquery.bassistance.de/jquery-getting-started.html)

