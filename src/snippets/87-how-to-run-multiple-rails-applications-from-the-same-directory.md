---
id: '87'
title: How to run multiple Rails applications from the same directory
languages:
- ruby
tags:
- ansible
- git
---
Set this in **environment.rb**:


```ruby
ActionController::AbstractRequest.relative_url_root = "/appname/"
ActionController::CgiRequest.relative_url_root = "/appname/"
```
    

