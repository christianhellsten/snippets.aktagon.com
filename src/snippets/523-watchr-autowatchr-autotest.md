---
id: '523'
title: Watchr + Autowatchr != autotest
languages:
- ruby
tags:
- arguments
- keywords
- options
- ruby
- splat
---

```ruby
require 'autowatchr'

Autowatchr.new(self) do |config|
  config.failing_only = false
end
```
    

They all suck…

