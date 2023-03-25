---
id: '643'
title: How to show Rails environment in Rails/Pry console
languages:
- ruby
tags:
---
Show Rails environment in Rails/Pry console by adding this to ~/.pryrc:


```ruby
def env
  env = Rails.env
  if env.production? 
    "\e[1;31m#{env}\e[0m - " 
  else
    "\e[1;30m#{env}\e[0m - " 
  end
end

prompt = env

Pry.config.prompt = [
  proc { |obj, nest_level, _| "#{prompt}(#{obj}):#{nest_level} > " },
  proc { |obj, nest_level, _| "#{prompt}(#{obj}):#{nest_level} * " }
]

Pry.config.hooks.add_hook(:before_session, :show_ruby_version) do
  puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
end
```
    

Environment name is shown in red, if in production. Note: use pry-rails gem…

