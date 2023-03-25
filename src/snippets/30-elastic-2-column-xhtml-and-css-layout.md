---
id: '30'
title: Elastic 2 column XHTML and CSS layout
languages:
- html
tags:
---
This is a slight modification of Roger Johansson's code that I found while reading [this article](http://www.456bereastreet.com/lab/developing_with_web_standards/csslayout/2-col/). I've modified the code to use ems instead of pixels. [Mike Jolley](http://blue-anvil.com/archives/going-elastic-with-ems-layout-techniques) has written about why ems are preferrable over pixels.


```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
  <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="description" content=""/>
  <style type="text/css">
  * {
    font-size:95%;
    font-family: georgia,'Times',serif;
  }

  body {
    min-width:62em;
  }
  
  #wrap {
    margin:0 auto;
    width:60em;
    border: 1px solid blue;
  }
  
  #content {
    float:left;
    width:40em;
    border: 1px solid blue;
  }

  #sidebar {
    float:right;
    width:19em;
    border: 1px solid blue;
  }

  #footer {
    clear:both;
    border: 1px solid blue;
  }
  </style>
</head>
<body>
  <div id="wrap">
    <div id="header">
      Header
    </div>
    <div id="nav">
    Navigation
    </div>
    <div id="content">
      Content
    </div>
    <div id="sidebar">
      Sidebar
    </div>
    <div id="footer">
      Footer
    </div>
  </div>
</body>
</html>
```
    

