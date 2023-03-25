---
id: '486'
title: starts_with? and ends_with? for Ruby
languages:
- ruby
tags:
- dump
- rails
- sql
- structure
---

```ruby
class String
  def starts_with?(prefix)
    prefix = prefix.to_s
    self[0, prefix.length] == prefix
  end

  def ends_with?(suffix)
    suffix = suffix.to_s
    self[-suffix.length..-1] == suffix
  end
end
```
    

