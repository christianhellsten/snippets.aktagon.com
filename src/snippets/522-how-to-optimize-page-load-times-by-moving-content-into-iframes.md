---
id: '522'
title: How to optimize page load times by moving content into iframes
languages:
- javascript
tags:
---
Optimizing page load times can be done by moving external content, such as banners and ads, into iframes. Iframes, however, make your page load slower which is why it's recommended to create the iframes dynamically.

With jQuery we could do this:


```javascript
function addBanner() {
  // iframe content affects page load time...
  $('#banners').html("<iframe frameborder="0" height='120px' scrolling='no' src='/banners.html' width='100%'></iframe>");
}
```
    

But as I found out this doesn't help page load times much as the main page's onload event is triggered after the iframe onload event.

The solution is an [optimization technique described by Aaron Peters](http://www.aaronpeters.nl/blog/iframe-loading-techniques-performance) to create the iframe with plain JavaScript:


```javascript
function addBanner() {
  // iframe content does not affect page load time...
  var i = document.createElement("iframe");
  i.src = "/banners.html";
  i.scrolling = "auto";
  i.frameborder = "0";
  i.width = "100%";
  i.height = "120px";
  document.getElementById("banners").appendChild(i);
}
```
    

Now all you have to do is call the addBanner in the onload event of the main page:


```javascript
<script>
$(document).ready(function() {
  addBanner();
}
</script>
```
    

This technique shaved ~2.5 seconds of page load times. Still, this might not be the optimal way to load iframes on your page, so check out the different [optimization techniques on Aaron Peters blog](http://www.aaronpeters.nl/blog/iframe-loading-techniques-performance).

