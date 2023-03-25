---
id: '923'
title: How to use unlogged PostgreSQL tables in Rails and ActiveRecord
languages:
- ruby
tags:
---
After calling create_table use a raw SQL statement to convert a table to unlogged:

```ruby
execute "ALTER TABLE xxx SET UNLOGGED;"
```
