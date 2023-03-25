---
id: '31'
title: Reset CSS rules to render HTML identically in all browsers
languages:
- css
tags:
- racket
---
These CSS rules remove most, if not all, browser specific styles from common HTML elements. Your page will look almost identical in all browser when using these CSS rules. Note that this is a combination of Tantek Celik's [undohtml.css](http://tantek.com/log/2004/undohtml.css) and YUI's [reset.css](http://developer.yahoo.com/yui/reset/).


```css
/** START BLATANT RIP FROM Tantek Celik's undohtml.css */

/* link underlines tend to make hypertext less readable, 
   because underlines obscure the shapes of the lower halves of words */
:link,:visited { text-decoration:none }

/** END BLATANT RIP FROM Tantek Celik's undohtml.css */

/** START BLATANT RIP FROM YUI's reset.css */

body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,p,blockquote,th,td {  
  margin:0; 
  padding:0; 
} 
table { 
  border-collapse:collapse; 
  border-spacing:0; 
} 
fieldset,img {  
  border:0; 
} 
address,caption,cite,code,dfn,em,strong,th,var { 
  font-style:normal; 
  font-weight:normal; 
} 
ol,ul { 
  list-style:none; 
} 
caption,th { 
  text-align:left; 
} 
h1,h2,h3,h4,h5,h6 { 
  font-size: 1em; 
  font-weight:normal; 
} 
q:before,q:after { 
  content:''; 
} 
abbr,acronym { 
  border:0; 
} 

/** START BLATANT RIP FROM YUI's reset.css */
```
    

