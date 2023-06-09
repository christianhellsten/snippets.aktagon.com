---
id: '789'
title: Mithril button example with debounce
languages:
- javascript
tags:
---
Live example:
https://jsfiddle.net/ah0pt5r3/

## Javascript

```javascript
// Source: https://davidwalsh.name/javascript-debounce-function
var debounce = function(func, wait, immediate) {
  var timeout;
  return function() {
    var context = this,
      args = arguments;
    var later = function() {
      timeout = null;
      if (!immediate) func.apply(context, args);
    };
    var callNow = immediate && !timeout;
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
    if (callNow) func.apply(context, args);
  };
};

// Widget model
Widget = function(data) {
  data = data || {}
  this.id = m.prop(data.id)
  this.name = m.prop(data.name)
  this.clicked = m.prop(0)
}

// A button that represents a Widget and that can be clicked.
WidgetButton = function(data) {
  var widget = new Widget(data);
  //
  // Triggered by mount.
  //
  this.controller = function() {
    // This is passed to the view
    return { "one": "two" }
  };
  //
  // Triggered after controller has finished executing.
  //
  this.view = function(ctrl) {
    // ctrl contains { "one": "two" }
    return [
      m("a.btn.btn-default.btn-sm", {
        id: "widget-" + widget.id(),
        onclick: this.onclick
      }, [
        m("span", widget.name() + " " + widget.clicked()),
      ])
    ];
  };
  //
  // Triggered when clicking the widget.
  //
  // Uses debounce timeout of 200 ms with immediate triggering.
  // In other words, only the first click in each 200 ms interval is triggered
  // instead of every click.
  //
  this.onclick = debounce(function(e) {
    widget.clicked(widget.clicked() + 1)
    console.debug("Clicked widget " + widget.id())
  }, 200, true);
}

var buttons = document.getElementsByClassName('widget-button');
for (ix in buttons) {
  var button = buttons[ix];
  m.mount(button, new WidgetButton({
    id: button.getAttribute("data-id"),
    name: button.getAttribute("data-name")
  }));
}
```

## HTML

```
<div class="widget-button" data-id="1" data-name="One"></div>
<div class="widget-button" data-id="2" data-name="Two"></div>
```
