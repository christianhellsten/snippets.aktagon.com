---
id: '172'
title: Hpricot's inner_text doesn't handle HTML entities correctly
languages:
- ruby
tags:
---
Hpricot's inner\_text method is fubar and doesn't handle HTML entities correctly, instead you'll see questionmarks in the output. To fix this replace calls to Hpricot's inner\_text with a call to the following method (or Monkey patch Hpricot):


```ruby
require 'rubygems'
require 'htmlentities'

  def inner_text(node)
     text = node.innerHTML.gsub(%r{<.*?>}, "").strip
     HTMLEntities.new.decode(text)
  end
```
    

Remember to install the htmlentities gem:


```ruby
sudo gem install htmlentities
```
    

