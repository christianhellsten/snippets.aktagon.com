---
id: '628'
title: Guard not picking up file changes?
languages:
- ruby
tags:
---
Add to Gemfile and uncomment relevant line:


```ruby
# Linux
  #gem 'rb-inotify'
  # OSX
  #gem 'rb-fsevent'
  # Windows
  # gem 'migrate-to-linux'
```
    

Run guard.

Still not working? Files on NFS or dropbox? Force polling with \*guard -p\*…

