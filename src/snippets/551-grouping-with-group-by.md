---
id: '551'
title: Grouping with group_by
languages:
- ruby
tags:
- docker
- rails
- ruby
- spring
---

```ruby
@groups = @products.group_by { |product| product.name.mb_chars[0].downcase.to_s }.sort
```
    

If you're using mb\_chars, remember to call "to\_s" or you won't get what you expect.

