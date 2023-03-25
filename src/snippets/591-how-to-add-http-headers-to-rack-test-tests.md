---
id: '591'
title: How to add HTTP headers to Rack::Test tests
languages:
- ruby
tags:
- connect
- read
- ruby
- socket
- tcp
- timeout
- write
---

```ruby
name = 'Content-Encoding'
value = 'utf-8'
current_session.header name, value
```
    

