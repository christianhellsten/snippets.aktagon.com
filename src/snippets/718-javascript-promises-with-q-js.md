---
id: '718'
title: JavaScript Promises With Q.js
languages:
- javascript
tags:
---
This [Q.js](https://github.com/kriskowal/q) example calls two asynchronous methods in sequence:


```javascript
class InitializeApp
  constructor: ->
    findDevice = ->
      df = Q.defer()
      onSuccess = (devices) ->
        console.log "Finding device"
        df.resolve("device 2")
      setTimeout(onSuccess, 2000)
      df.promise

    connectToDevice = (id) ->
      df = Q.defer()
      onSuccess = ->
        console.log "Connecting to #{id}"
        df.resolve("success")
      setTimeout(onSuccess, 2000)
      df.promise

    findDevice().then(connectToDevice)
```
    

Usage:


```javascript
new InitializeApp()
# ...Sleep 2 seconds
# => Finding device
# ...Sleep 2 seconds
# => Connecting to device 2
```
    

