---
id: '429'
title: How to parse request parameters with JavaScript
languages:
- javascript
tags:
---
Code:


```javascript
var Request = {
    parameter: function(name) {
      return this.parameters()[name];
    },
    parameters: function(uri) {
      var i, parameter, params, query, result;
      result = {};
      if (!uri) {
        uri = window.location.search;
      }
      if (uri.indexOf("?") === -1) {
        return {};
      }
      query = uri.slice(1);
      params = query.split("&");
      i = 0;
      while (i < params.length) {
        parameter = params[i].split("=");
        result[parameter[0]] = parameter[1];
        i++;
      }
      return result;
    }
  };
```
    

Examples:


```javascript
// ?query=test
var query = Request.parameter('query');

var parameters = Request.parameters();
// This works too
var query = parameters.query;
// And this
var query = parameters['query'];

// Replacing a parameter is easy with jQuery
parameters Request.parameters();
// change sort order
parameters.order = 'new-world-order'
new_parameters = $.param(parameters)
url = window.location.pathname + "?" + new_parameters
```
    

