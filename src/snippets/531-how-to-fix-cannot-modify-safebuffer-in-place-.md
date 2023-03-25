---
id: '531'
title: How to fix "Cannot modify SafeBuffer in place"
languages:
- ruby
tags:
---
If you get this error:


```ruby
Cannot modify SafeBuffer in place
ruby/1.8/gems/activesupport-3.0.9/lib/active_support/core_ext/string/output_safety.rb:119:in gsub!'
ruby/1.8/xmlrpc/create.rb:54:in text'
```
    

You might need to upgrade haml, or if that doesn't help you need to convert the SafeBuffer to a String. In this case it's the parameters given to an XML-RPC call that need to be converted to strings:


```ruby
XMLAPI.start(safebuffer_string.to_str)
```
    

In other words the solution is to update your gem or use .to\_str.

