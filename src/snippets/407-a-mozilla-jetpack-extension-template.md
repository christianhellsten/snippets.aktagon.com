---
id: '407'
title: A Mozilla Jetpack extension template
languages:
- javascript
tags:
---
Jetpack extension:


```javascript
jetpack.future.import('menu');
jetpack.future.import('selection');
 
jetpack.menu.context.page.on('img').add(function(target) ({
  label:   "Post to flickr.com",
  icon:    "http://xxx/icon.png",
  command: function() {
    var url = "http://flickr.com/api?";

    var selectedText = jetpack.selection.text || '';
    var sourceImage   = target.node.src;
    var sourcePage = jetpack.tabs.focused.url;

    url += encodeURI('image') + '=' + encodeURI(sourceImage);
    url += '&' + encodeURI('description') + '=' + encodeURI(selectedText.substr(0, 200));

    jetpack.tabs.open(url).focus(); 
  }
}));
```
    

Installation page:


```javascript
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html lang="en">
<head>
    <title>The Jetpack Feature</title>
    <link rel="jetpack" href="/javascripts/jetpack-extension.js" name="com extension" />
</head>
<body>
</body>
</html>
```
    

