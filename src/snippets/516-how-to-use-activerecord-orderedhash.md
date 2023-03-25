---
id: '516'
title: How to use ActiveRecord::OrderedHash
languages:
- ruby
tags:
- column
- detection
- python
---
Ruby 1.8 doesn't retain the order of objects inserted in to a hash, but with ActiveSupport::OrderedHash you can do this:


```ruby
a=ActiveSupport::OrderedHash[:one, 1, :two, 2]
```
    

which gives you:


```ruby
=> #<OrderedHash {:one=>1, :two=>2}>
```
    

