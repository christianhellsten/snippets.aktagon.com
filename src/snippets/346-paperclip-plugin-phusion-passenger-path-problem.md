---
id: '346'
title: Paperclip plugin + Phusion Passenger + path problem
languages:
- ruby
tags:
- mac
- pmset
- sleep
---
In config/initializers/paperclip.rb put:


```ruby
if RAILS_ENV == "development"
  Paperclip.options[:command_path] = '/opt/local/bin/'
else
  Paperclip.options[:command_path] = '/usr/bin/'
end
```
    

Note image\_magick\_path is deprecated alias of command\_path.

