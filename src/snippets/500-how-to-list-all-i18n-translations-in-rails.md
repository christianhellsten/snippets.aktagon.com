---
id: '500'
title: How to list all I18n translations in Rails
languages:
- ruby
tags:
- '"raw sql"'
- sqlalchemy
- yield_for
---
In the Rails console execute:


```ruby
I18n.backend.send(:translations)[:en]
```
    

