---
id: '295'
title: How to print SQL to standard out with script/console and irb
languages:
- bash
tags:
- activerecord
- pagination
---

```bash
ActiveRecord::Base.logger = Logger.new(STDOUT)
```
    

