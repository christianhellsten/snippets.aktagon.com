---
id: '465'
title: How to draw driving directions on a Google map (API V3)
languages:
- javascript
tags:
---
This snippet gives you the driving directions from the center of the map to Dubai:


```javascript
var directionsDisplay = new google.maps.DirectionsRenderer();
var directionsService = new google.maps.DirectionsService();

var request = {
  origin:  map.getCenter(), 
  destination: 'Dubai',
  travelMode: google.maps.DirectionsTravelMode.DRIVING
};

directionsService.route(request, function(result, status) {
  if (status == google.maps.DirectionsStatus.OK) {
     // Display the distance:
     $('#distance').html(result.routes[0].legs[0].distance.value + " meters");
     // Display the duration:
     $('#duration').html(result.routes[0].legs[0].duration.value + " seconds");
    directionsDisplay.setDirections(result);
    directionsDisplay.setMap(map);
  }
});
```
    

