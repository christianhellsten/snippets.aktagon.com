---
id: '324'
title: 'Ruby Hash except and only '
languages:
- ruby
tags:
---

```ruby
class Hash
  def except(*blacklist)
    reject {|key, value| blacklist.include?(key) }
  end

  def only(*whitelist)
    reject {|key, value| !whitelist.include?(key) }
  end
end
```
    

