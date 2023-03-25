---
id: '626'
title: Font rendering tricks in CSS
languages:
- css
tags:
- connect
- read
- tcp
- timeout
- write
---

```css
text-rendering: optimizeLegibility; // Improved handling of kerning pairs and ligatures
-webkit-font-smoothing: antialiased; // Make font look the same in Chrome & Safari
```
    

Kerning and ligature:


```css
-webkit-font-feature-settings: "kern", "liga", "case";
-moz-font-feature-settings: "kern", "liga" , "case";
font-feature-settings: "kern", "liga", "case";
```
    

