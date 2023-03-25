---
id: '557'
title: How to Add a Console to Sinatra Applications
languages:
- ruby
tags:
---
In your application directory, create .pryrc:


```ruby
Pry.config.editor = "gvim --nofork"

# Print Ruby version at startup
Pry.config.hooks.add_hook(:when_started, :say_hi) do
  puts "Using Ruby version #{RUBY_VERSION}"
end

# Require Sinatra application
require 'config/environment'
```
    

Now you can start the console by typing:


```ruby
$ pry
# or with bundler :(
$ bundle exec pry
```
    

