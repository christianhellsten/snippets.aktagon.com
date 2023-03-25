---
id: '359'
title: How to fix "Unknown column 'id' in 'where clause'" error when using has_many
  :through
languages:
- ruby
tags:
- nvim
- orgmode
- python
---
This error is mostly likely caused indirectly by has\_many through, which requires an id column to be present in the join table in a many-to-many relationship:


```ruby
ActiveRecord::StatementInvalid: Mysql::Error: Unknown column 'id' in 'where clause': DELETE FROM brand_posts WHERE id = NULL
```
    

The fix is to create the id column, which in this case is done like this:


```ruby
add_column :brand_posts, :id, :primary_key
```
    

