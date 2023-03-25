---
id: '77'
title: How to create a mixed 2 to 3 column layout with footer and header
languages:
- html
tags:
- encoding
- go
- golang
- parser
- rss
- xml
---
This is a draft, and an experiment with [composing to a vertical flow](http://24ways.org/2006/compose-to-a-vertical-rhythm) and the [golden ratio](http://www.bestcodingpractices.com/fibonacci_and_golden_ratio_in_web_design-39.html)


```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>3 column</title>
<style type="text/css">

/** Reset styles */
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,p,blockquote,th,td {
  margin:0;
  padding:0;
} 

/** 3 column layout */

#container{
  background-color:#9cc;
  width: 69em;
  margin: 0 auto;
}

#content{
  float: left;
  width: 41em;
}

#sidebar{
  float: right;
  width: 23em;
}

#column1{
  float: left;
  width:23em;
}

#column2{
  float: left;
  width:23em;
}

#column3{
  float: left;
  width:23em;
}


/* Vertical flow */

body {
  font-size: 75%;
}
  
html>body {
  font-size: 14px;
}
  
p {
  line-height 1.5em;
}


/* Temp styles */
#column1, #column2, #column3, #content, #sidebar {
#  background: blue;
  #  border: 1px solid black;
}

/** */
body{
  font-family: Palatino,"Palatino Linotype",Georgia,serif;
}

</style>
</head>
<body>

  <div id="header">
    <div id="container">
      <div id="column1">Header 1</div>
      <div id="column2">Header 2</div>
      <div id="column3">Header 3</div>
    </div>
  </div>

  <div id="container">
    <div id="content">Content</div>
    <div id="sidebar">Sidebar</div>
  </div>

  <div id="footer">
    <div id="container">
      <div id="column1">Footer 1</div>
      <div id="column2">Footer 2</div>
      <div id="column3">Footer 3</div>
    </div>
  </div>

</body>
</html>
```
    

