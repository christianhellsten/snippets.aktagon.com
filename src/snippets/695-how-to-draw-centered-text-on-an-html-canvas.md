---
id: '695'
title: How to draw centered text on an HTML canvas
languages:
- javascript
tags:
---
Draw centered text on an HTML canvas:


```javascript
canvas = ...
// Device dependent pixel ratio, also changes when zooming
pixelRatio = window.devicePixelRatio || 1
// Centered text
ctx.textAlign = "center"
ctx.textBaseline = "middle"
// Font size
fontSize = 20
// Adaptive bold font
ctx.font = 'bold ' + Math.round(fontSize/pixelRatio) + 'px Oswald'
// Measure text width
textRect = ctx.measureText(text)
// Figure out where to position the text
x = (canvas.width / 2) / pixelRatio
y = ((canvas.height / 2) - (fontSize*2)) / pixelRatio
// Draw the text
ctx.fillText("Hello world" , x, y)
```
    

The code adapts the font size and text position to fit the selected zoom level (e.g. 200%) and the current device (e.g. mobile).

