---
id: '708'
title: Ruby's call method
languages:
- ruby
tags:
---
What does this print:


```ruby
class RubyCall
  def call(*args)
    puts "Call: #{args}"
  end
end

xxx = RubyCall.new
xxx.("hello", 1, 2, 3)
```
    

It calls the \#call method and prints "Call: \["hello", 1, 2, 3\]".

If you want you can do this:


```ruby
xxx::call('adsf')
xxx.call('adsf')
```
    

