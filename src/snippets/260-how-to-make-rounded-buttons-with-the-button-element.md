---
id: '260'
title: How to make rounded buttons with the button element
languages:
- html
tags:
---
25 pixel high buttons at your service:


```html
button { 
	border: 0; 
	padding: 0;
	font-variant: small-caps;
	height:25px;
	background: transparent url('../images/button-background-left.png') no-repeat;
	cursor: pointer;
	text-align: center; 
}

button span { 
	font-family: georgia,serif;
	line-height: 25px;
	background: transparent url('../images/button-background.png') no-repeat top right;
	position:relative; 
	display:block; 
	white-space:nowrap; 
	margin-top: -2px;
	padding:0 15px; 
}
```
    

HTML:


```html
<button type="submit" value="Hello"><span>Hello&nbsp;&raquo;</span></button>
```
    

IE 6 & 7 might need:


```html
button { 
  width:auto; 
  overflow:visible; 
}
button span { 
  margin-top:1px; 
}
```
    

References
----------

-   http://www.filamentgroup.com/lab/styling\_the\_button\_element\_with\_sliding\_doors/
-   http://particletree.com/features/rediscovering-the-button-element/


