---
id: '658'
title: How to dump a Rails schema from the console
languages:
- ruby
tags:
---
```ruby
ActiveRecord::SchemaDumper.dump ActiveRecord::Base.connection, File.open('schema.rb', 'w')
```
    

