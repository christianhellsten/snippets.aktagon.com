---
id: '376'
title: Google Maps Version 3 Example with Markers and InfoWindow
languages:
- html
tags:
---

```html
<style media="screen" type="text/css">
  #map { width:960px; height:330px; }
</style>


<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

<div id="map"></div>

<script type="text/javascript">
  var map;
  var marker;
  var initialized = false;

  var infowindow = new google.maps.InfoWindow({
    content: '',
    //disableAutoPan: true // Not compatible with InfoWindows. They are cropped...
  });

  // Triggered when map is loaded or moved
  var boundsChangedListener = function() {
    if(initialized == true) { return };

    initialized = true;

    addMarkers();
  };

  function addMarkers() {
    var bounds = map.get_bounds();
    var southWest = bounds.getSouthWest();
    var northEast = bounds.getNorthEast();

    var lngSpan = northEast.lng() - southWest.lng();
    var latSpan = northEast.lat() - southWest.lat();

    var icon = '/images/icons/xxx-club-16.gif';

    for (var i = 0; i < 10; i++) {
      var point = new google.maps.LatLng(
        southWest.lat() + latSpan * Math.random(),
        southWest.lng() + lngSpan * Math.random()
      );

      var marker = new google.maps.Marker({
        position: point, 
        map:      map, 
        icon:     icon, 
        title:    "Marker"
      });   

      addMarker(marker);
    }
  }

  function addMarker(marker) {
    google.maps.event.addListener(marker, 'mouseover', function() {
      marker.html = 'Marker xxx';
      infowindow.open(map, marker);
    });

    google.maps.event.addListener(marker, 'mouseout', function() {
      infowindow.close();
    });
  }
</script>
```
    

