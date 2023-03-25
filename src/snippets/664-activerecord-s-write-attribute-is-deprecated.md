---
id: '664'
title: ActiveRecord's write_attribute is deprecated
languages:
- ruby
tags:
---
ActiveRecord's write\_attribute is deprecated, so now you only have one hundred other ways of assigning attributes.

My favorite for dynamic assignment of attributes is:


```ruby
class Dog
  def crap=(poo)
     self[:trash] = poo # don't try to use self.attributes[:trash] here you fool.
  end

  def crap
     self[:trash] # don't try to use self.attributes[:trash] here you fool.
  end
end
```
    

