---
id: '271'
title: How to make Rails plugins reloadable
languages:
- ruby
tags:
- json
- jsonb
- postgres
- sql
---
I found this snippet on the [Railshacks blog](http://railshacks.blogspot.com/2008/03/expected-user-got-user-forcing-to.html):


```ruby
# Array of plugins that you want to be reloaded on each request
reloadable_plugins = ["has_markup"]

# Remove the plugins from the load_once_paths variable
reloadable_plugins.each do |plugin_name|
  reloadable_path = RAILS_ROOT + "/vendor/plugins/#{plugin_name}/lib"
  Dependencies.load_once_paths.delete(reloadable_path)
end
```
    

