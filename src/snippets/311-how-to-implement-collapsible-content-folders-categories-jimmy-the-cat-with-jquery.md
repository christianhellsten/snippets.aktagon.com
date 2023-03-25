---
id: '311'
title: How to implement collapsible content (folders, categories, jimmy the cat) with
  jQuery
languages:
- javascript
tags:
---
This here is a quick-and-dirty implementation of folders for jQuery:

Markup
------

Any markup following the naming conventions should work, for example:


```javascript
<ul class="collapsible">
  <li>
     <a href="" class="toggle-button">This be the folder</a>
    <ul style="display:none" class="collapsible-content">
        <li>This be the folder content</li>
        <li>This be the folder content</li>
    </ul>
  </li>
</ul>
```
    

JavaScript
----------


```javascript
/**
 * Collapsible categories implementation.
 * 
 */
var category = {
  find_category: function(target) {
    var category = target;
    // This isn't the category, so look for it
    if(!target.hasClass('collapsible')) {
      category = target.closest('.collapsible');
    }
    return category;
  },
  collapse: function(target) {
    var category = this.find_category(target);
    category.find('.collapsible-content').hide();
    category.removeClass('expanded');
    category.addClass('collapsed');
  },
  expand: function(target) {
    var category = this.find_category(target);
    category.find('.collapsible-content').show();
    category.addClass('expanded');
    category.removeClass('collapsed');
  },
  toggle: function(target) {
    var category = this.find_category(target);

    var is_expanded = category.hasClass('expanded');

    if(is_expanded) {
      this.collapse(category);
    } else {
      this.expand(category);
    }
  }
}
```
    

Usage
-----


```javascript
$('.toggle-button').live('click', function() {
  category.toggle($(this));
  return false;
});
```
    

