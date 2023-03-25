---
id: '579'
title: How to use History.js or jQuery Address for HTML5 pushState navigation
languages:
- javascript
tags:
---
Please don't use History.js. It's not maintained and [has over 100 issues](https://github.com/balupton/history.js/issues). [Use jQuery Address](http://www.asual.com/jquery/address/) and remember to [read the documentation](http://www.asual.com/jquery/address/docs/).

Example usage:


```javascript
# muy importante
$.address.state('/') 
# mas importante
$.address.value(window.location.pathname + window.location.search)
# donde ocurre
$.address.change (event) ->
  loadPage()
```
    

Another example:


```javascript
$.address
  .state('/')
  .path(window.location.pathname + window.location.search)
  .change (event) =>
    loadPage()
```
    

[jQuery address examples](http://www.asual.com/jquery/address/samples/)

