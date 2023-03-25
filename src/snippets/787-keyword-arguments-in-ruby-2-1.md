---
id: '787'
title: Keyword arguments in Ruby +2.1
languages:
- ruby
tags:
---
Before keyword arguments were introduced in Ruby:

```ruby
def call(options={})
  puts options[:optional_param]
  puts options.fetch(:optional_param_with_default, 'default')
  puts options.fetch(:mandatory_param)
end
```

After:
```ruby
def call(mandatory_param:, optional_param: nil, optional_param_with_default: 'default')
  puts optional_param
  puts optional_param_with_default
  puts mandatory_param
end
```
