---
id: '722'
title: How to mark deprecated methods in Ruby
languages:
- ruby
tags:
---
This code can be used to mark deprecated methods in Ruby:


```ruby
module Kernel
  def mark_deprecated(new_method)
    warn "DEPRECATED: the #{__method__} called from #{caller.first} has been deprecated and replaced by #{new_method}!!!"
  end
end
```
    

Example:


```ruby
class Horse
  def self.shit
    mark_deprecated("Bull.shit")
  end
end
```
    

