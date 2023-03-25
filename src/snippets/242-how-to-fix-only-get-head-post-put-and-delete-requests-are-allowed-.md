---
id: '242'
title: How to fix "Only get, head, post, put, and delete requests are allowed."
languages:
- ruby
tags:
- example
- jester
- nim
---
I'm getting this once in a while in development mode after changing the routes configuration:


```ruby
ActionController::MethodNotAllowed

Only get, head, post, put, and delete requests are allowed.
```
    

The solution for me has been to restart the server.

