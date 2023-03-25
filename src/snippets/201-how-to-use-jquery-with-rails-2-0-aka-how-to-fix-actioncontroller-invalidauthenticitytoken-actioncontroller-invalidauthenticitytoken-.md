---
id: '201'
title: How to use jQuery with Rails 2.0 - aka How to fix "ActionController::InvalidAuthenticityToken
  (ActionController::InvalidAuthenticityToken)"
languages:
- ruby
tags:
---
This is a slight variation of [Henrik Nyh's code](http://henrik.nyh.se/2008/05/rails-authenticity-token-with-jquery), which fixes an issue with IE6 that makes all Ajax requests use POST in IE6.

In application.html.erb, or whatever layout file you're using, put:


```ruby
<%= javascript_tag "window.AUTH_TOKEN = '#{form_authenticity_token}';" %>
```
    

In application.js, or whatever JavaScript file you're using, put:


```ruby
$(document).ajaxSend(function(event, request, settings) {
  if (typeof(window.AUTH_TOKEN) == "undefined") return;
  // IE6 fix for http://dev.jquery.com/ticket/3155
  if (settings.type == 'GET' || settings.type == 'get') return;

  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(window.AUTH_TOKEN);
});
```
    

That's all...

