---
id: '686'
title: Render Rabl Views Anywhere (views, jobs, mails)
languages:
- ruby
tags:
---
A helper for rendering Rabl views anywhere, e.g. background jobs, views, mails, etc:


```ruby
def render_rabl(locals, view, options = {})
  scope = Object.new
  locals.each do |key, value|
    scope.instance_variable_set :"@#{key}", value
  end
  options = { format: :json, scope: scope }.merge(options)
  Rabl.render(nil, view, options)
end
```
    

Usage:


```ruby
locals = { users: User.all }
view = 'users/index'
render_rabl locals, view
```
    

