---
id: '372'
title: How to use the Geolocation API
languages:
- javascript
tags:
---
Firefox 3.1 supports the [geolocation API specification](http://dev.w3.org/geo/api/spec-source.html).

Try copying this code and running it in Firebug:


```javascript
function showMap(position) {
  // Show a map centered at (position.coords.latitude, position.coords.longitude).
  console.dir(position);
}

navigator.geolocation.getCurrentPosition(showMap);
```
    

