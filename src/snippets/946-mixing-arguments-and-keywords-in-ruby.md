---
id: '946'
title: Mixing arguments and keywords in Ruby
languages:
- ruby
tags:
---
Mixing arguments and keywords in Ruby:

```ruby
def hello(*args, **keywords)
  { args: args, keywords: keywords }
end
```

Splat to the rescue:

\* turns all arguments into an array.

** turns all keyword arguments into a hash.

This allows you to do the following:

```ruby
hello(:one, :two, { three: :four })
# or, simply
hello(:one, :two, three: :four)

=> {:args=>[:one, :two], :keyword_args=>{:three=>:four}}
```

Readability is improved by using proper names:

```ruby
def hello(name, **options)
  { name: name, options: options }
end
```
