---
id: '291'
title: How to make a DIV element fill the browser window
languages:
- css
tags:
- disk
- '"disk space"'
- kill
- notification
- osx
---

```css
<html>
<body>
<style type="text/css">
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
}
#container { /* div you want to stretch */
  background-color: green;
  height: 100%; /** IE 6 */
  min-height: 100%;
}
</style>
  <div id="container">
    This div should cover the whole page.
  </div>
</body>
</html>
```
    

Here's an [example with header and footer](http://fredvaux.com/mdc/ultrashock/awesome.html).

