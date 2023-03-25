---
id: '453'
title: 'Ruby: struct to hash & hash to struct conversion'
languages:
- ruby
tags:
- branch
- git
- rubocop
---
Struct to Hash:


```ruby
class Struct
  def to_hash
    Hash[*members.zip(values).flatten]
  end
end
```
    

Hash to Struct:


```ruby
class Hash
  def to_struct(name)
    Struct.new(name, *keys).new(*values)
  end
end
```
    

