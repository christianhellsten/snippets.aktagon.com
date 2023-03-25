---
id: '687'
title: Automatic Instantiation of Web Components Written in JavaScript/Coffeescript
languages:
- coffeescript
tags:
---
Your app.js.coffee:


```coffeescript
$ ->
  for component in $('.web-component')
    component = $(component)
    class_name = component.data('class')
    id = "#" + component.attr('id')
    component_class = eval.call(window, class_name)
    if component_class
      console.debug("Creating #{class_name}")
      try
        new component_class(id)
      catch error
        console.log "Failed to create #{class_name}"
    else
      throw "UI component '#{class_name}' does not exist."
```
    

Declare a web component in your view:


```coffeescript
<div id="alerts" class="web-component" data-class="App.Alerts"/>
```
    

Write your web component, e.g. app/assets/javascripts/components/alert.js.coffee:


```coffeescript
root = exports ? this
# declared elsewhere
# root.App = {}

class Alerts
....

root.App.Alerts = Alerts
```
    

