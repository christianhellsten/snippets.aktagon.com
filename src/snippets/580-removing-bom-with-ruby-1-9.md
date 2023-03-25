---
id: '580'
title: Removing BOM with Ruby 1.9
languages:
- ruby
tags:
- lol
- node
- node-sass
---
Removing the BOM with Ruby 1.9:


```ruby
body = File.open(file, "r:bom|utf-8").read()
File.open(file, 'w') do |xass| 
  xass << body
end
```
    

In Ruby 1.8 you could do something like this:


```ruby
body = body[3..-1] if body[0..2] == "\357\273\277"
```
    

