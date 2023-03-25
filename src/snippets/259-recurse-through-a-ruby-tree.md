---
id: '259'
title: Recurse through a Ruby tree
languages:
- css
tags:
- ansible
- version
---
The model:


```css
class Category
...
  def recurse
    yield(self)

    children.each do |child|
      child.recurse {|sibling| yield sibling}
    end
  end
end
```
    

The recusion:


```css
Category.root.recurse do |child|
  puts child
end
```
    

