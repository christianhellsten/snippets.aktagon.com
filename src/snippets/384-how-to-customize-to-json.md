---
id: '384'
title: How to customize to_json
languages:
- ruby
tags:
---

```ruby
def to_json(options = {})
  if options.empty?
    super :only => [:id, :name]
  else
    super options
  end
end
```
    

Now post.to\_json will only include the id and name attributes.

Note that for arrays of objects--at least with Rails 2.3.4--you need use the same parameters on the array.to\_json method:


```ruby
Post.all.to_json :only => [:id, :name]
```
    

