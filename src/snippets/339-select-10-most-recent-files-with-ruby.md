---
id: '339'
title: Select 10 most recent files with Ruby
languages:
- ruby
tags:
- crashloopbackoff
- kubectl
- kubernetes
---

```ruby
base_dir = '/tmp/'
Dir.entries(base_dir).select{|f| File.file? "#{base_dir}#{f}" }.sort_by { |f| File.mtime("#{base_dir}#{f}") }.reverse[0..9]
```
    

