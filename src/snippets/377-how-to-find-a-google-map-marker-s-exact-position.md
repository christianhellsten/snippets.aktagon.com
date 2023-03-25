---
id: '377'
title: How to find a Google Map marker's exact position
languages:
- javascript
tags:
- git
- pull
- push
- rebase
---
You need a custom OverlayWindow:


```javascript
function ProjectionHelperOverlay(map) {
  this.set_map(map);
}

ProjectionHelperOverlay.prototype = new google.maps.OverlayView();
ProjectionHelperOverlay.prototype.draw = function () {
  if (!this.ready) {
    this.ready = true;
    google.maps.event.trigger(this, 'ready');
  }
}; 

overlay = new ProjectionHelperOverlay(map);
```
    

And you need to find the markers position relative to the overlay:


```javascript
google.maps.event.addListener(marker, 'mouseover', function(event) {
  var p = overlay.get_projection().fromLatLngToDivPixel(marker.get_position());

  // map world relative to map container
  var container = overlay.get_panes().mapPane.parentNode;
  var x = p.x + parseInt(container.style.left);
  var y = p.y + parseInt(container.style.top);
});
```
    

Code found in [this thread](http://groups.google.com/group/google-maps-js-api-v3/browse_thread/thread/f30e8dfad9cb2c9b) on Google Groups.

