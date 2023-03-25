---
id: '714'
title: CoffeeScript variable visibility
languages:
- coffeescript
tags:
---
This Coffeescript:


```coffeescript
class Device
  x: 1 # Instance variable
  y = 2 # Private instance variable
  @z: 3 # Class variable

 # Address and name are instance variables
  constructor: (@address, @name) ->
```
    

gives us this JavaScript:


```coffeescript
Device = (function() {
  var y;
  Device.prototype.x = 1;
  y = 2;
  function Device(address, name) {
    this.address = address;
    this.name = name;
  }
  return Device;
})();
```
    

and the following visibility:


```coffeescript
dev = new Device('X', 'Y') # => Device {address: "X", name: "Y", x: 1}
dev.y # => undefined
Device.z # => 3
```
    

