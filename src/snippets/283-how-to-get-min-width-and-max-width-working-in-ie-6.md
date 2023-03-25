---
id: '283'
title: How to get min-width and max-width working in IE 6
languages:
- html
tags:
- activerecord
- bind
- find_by_sql
- parameters
- raw
- select_all
- select_value
- sql
---
Far from optimal, but should work in most cases:


```html
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="ie6-is-a-shitty-browser.css" />
<![endif]-->
```
    


```html
#wrapper { 
   width:expression(document.body.clientWidth < 950 ? "950px" : "100%" ); 
}
```
    

Note that users might get security warnings.

