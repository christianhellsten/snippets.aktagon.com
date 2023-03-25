---
id: '674'
title: How to prepend a directory to the view path in Rails (3, 4, etc)
languages:
- ruby
tags:
---
prepend\_view\_path is your friend when you want to use different views in the same app for different configurations, e.g. same code for different apps/sites/etc:


```ruby
class ApplicationController ....
   prepend_view_path Rails.root.join('app', 'views', ENV['APP'])
end
```
    

prepend\_view\_path can also be called e.g. once per request before rendering the view to have different view templates for each subdomain, user, cat, etc.

