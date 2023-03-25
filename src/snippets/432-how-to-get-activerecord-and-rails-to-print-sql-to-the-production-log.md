---
id: '432'
title: How to get ActiveRecord and Rails to print SQL to the production log
languages:
- ruby
tags:
- for
- loop
- postgresql
- previous
- quarter
---
Add to the end of config/environment.rb:


```ruby
ActiveRecord::Base.logger.level = Logger::DEBUG
```
    

