---
id: '3'
title: Improve page load times by combining JavaScript and CSS files
languages:
- ruby
tags:
---
Add **cache =&gt; true** to combine JavaScript and CSS files and improve page load times.

See [changeset 6164](http://dev.rubyonrails.org/changeset/6164) for more information


```ruby
<%= stylesheet_link_tag     'all',      :cache => true %>
    <%= javascript_include_tag  :defaults,  :cache => true %>
```
    

