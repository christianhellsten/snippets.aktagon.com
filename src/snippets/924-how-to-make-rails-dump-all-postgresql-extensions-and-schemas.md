---
id: '924'
title: How to make Rails dump all PostgreSQL extensions and schemas
languages:
- ruby
tags:
---
How to make Rails dump all PostgreSQL extensions and schemas to structure.sql.

Create a file named config/initializers/dump_schemas.rb containing:

```ruby
ActiveRecord::Base.dump_schemas = :all
```
