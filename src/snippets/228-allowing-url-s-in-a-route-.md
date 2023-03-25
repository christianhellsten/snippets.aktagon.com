---
id: '228'
title: Allowing URL's in a route.
languages:
- ruby
tags:
---
I wanted to create a route that could accept an URL as a parameter. The problem was that dots and slashes were interpreted as separators for the route. Luckily I managed to find [this](http://www.soulcast.com/post/show/62917/ruby-on-rails-routes) post that explained how it could be bypassed.


```ruby
map.connect ':scale/:text.:format', :controller => 'barcode', :requirements => { :text => /.*/ }
```
    

With this route set up I now could catch parameters like this: http://localhost:3000/200x200/http://aktagon.com.png, where 200x200 is :scale, http://aktagon.com is :text and .png is :format.

