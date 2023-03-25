---
id: '443'
title: How to allow reloading of Rails plugins in development mode
languages:
- ruby
tags:
- d3.js
- range
- tick
- x-axis
---
Add this to config/environment.rb to allow your plugins to be reloaded on each new request:


```ruby
config.reload_plugins = true if Rails.env == 'development'
```
    

See [this commit](http://github.com/rails/rails/commit/cc2d6a0b93251fce06bab15c52dbe0a5d5a8342c) for details.

