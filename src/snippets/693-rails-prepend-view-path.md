---
id: '693'
title: Rails prepend_view_path
languages:
- ruby
tags:
---
Good
----


```ruby
class ApplicationController < ActionController::Base
  prepend_view_path 'x/y/z/views'
end
```
    

Bad
---


```ruby
# config/initializer/view_path.rb
ApplicationController.prepend_view_path 'x/y/z/views'
```
    

In development mode (Rails 3.x) this doesn't seem to work under some circumstances, i.e. the prepended path is lost after Rails' reloads after you modify certain files.

