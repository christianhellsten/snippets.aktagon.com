---
id: '464'
title: How to draw a circle on a Google map (API V3)
languages:
- javascript
tags:
- extension
- postgresql
- sql
- structure
---

```javascript
var latlng = new google.maps.LatLng(lng, lat);
// 200km radius
var circle = new google.maps.Circle({radius: 200*1000, center: latlng}); 
circle.setCenter(map.getCenter());
circle.setMap(map);
//map.fitBounds(circle.getBounds());
```
    

