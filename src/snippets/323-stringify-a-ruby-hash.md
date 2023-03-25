---
id: '323'
title: Stringify a Ruby Hash
languages:
- ruby
tags:
- bundler
- command
- env
- open3
- popen3
- security
- shell
---

```ruby
class Hash
  def stringify
    inject({}) do |options, (key, value)|
      options[key.to_s] = value.to_s
      options
    end
  end

  def stringify!
    each do |key, value|
      delete(key)
      store(key.to_s, value.to_s)
    end
  end
end
```
    

