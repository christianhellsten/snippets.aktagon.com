---
id: '706'
title: Big Search Field & Button = Beautiful?
languages:
- html
tags:
---

```html
<html>
<head>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css"/>
<style>

.search-form {
  width: 40%;
  min-width: 400px;
  border: 6px solid rgba(0, 0, 0, 0.7);
  margin: 20px auto 0;
}

input.text {
  float: left;
  width: 80%;
  border: 5px solid #fff;
  margin: 0;
  outline: none;
  font-size: 17px;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  -ms-border-radius: 0;
  -o-border-radius: 0;
  border-radius: 0;
  -webkit-appearance: none;
  color: #3c3c3c;
}


input.text, input.button {
  padding: 15px;
  font-size: 17px;
  font-weight: 800;
  display: inline-block;
  -webkit-transition: all 0.3s ease;
  -moz-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  transition: all 0.3s ease;
}

input.button {
  float: right;
  width: 20%;
  margin: 0;
  border: 5px solid grey;
  color: #fff;
  background-color: grey;
  -webkit-appearance: none;
  padding-left: 0;
  padding-right: 0;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  -ms-border-radius: 0;
  -o-border-radius: 0;
  border-radius: 0;
}

.clearfix {
  overflow: auto;
}

* {
  font-family: "Helvetica", sans-serif;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

</style>
</head>
<body>
  <div class="search-form clearfix">
    <input name="query" class="text" type="text" placeholder="Find your dog&hellip;">
    <input type="submit" value="Search" class="button">
  </div>
</body>
</html>
```
    

