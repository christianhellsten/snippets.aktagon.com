---
id: '627'
title: 'ERB "incompatible character encodings: ISO-8859-1 and UTF-8 (Encoding::CompatibilityError)"'
languages:
- ruby
tags:
---
If you get the following error with ERB, Slim, Tilt, Ruby 1.9 or any combination of those:


```ruby
incompatible character encodings: ISO-8859-1 and UTF-8 (Encoding::CompatibilityError)
```
    

try adding this:


```ruby
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
```
    

