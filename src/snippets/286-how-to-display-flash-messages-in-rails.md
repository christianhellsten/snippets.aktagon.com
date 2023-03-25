---
id: '286'
title: How to display Flash messages in Rails
languages:
- ruby
tags:
- modulo
- range
---
Place the following in your ERB view:


```ruby
<% [:info, :error].each do |key| %>
  <% if flash[key] %>
  <div class="<%= key %>" id="flash">
    <%= flash[key] %>
  </div>
  <% end %>
<% end %>
```
    

or use the following if you prefer Haml:


```ruby
- [:notice, :error, :success].each do |key|
  - unless flash[key].blank?
    %p{ :class => "flash #{key}" }= flash[key]
```
    

