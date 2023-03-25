---
id: '567'
title: A simple static HTTP server with Thin
languages:
- ruby
tags:
- '"copy from"'
- postgresql
- quote
---
Create config.ru:


```ruby
run Rack::Directory.new(Dir.pwd)
```
    

Create Gemfile:


```ruby
source :rubygems
gem 'thin'
```
    

Run:


```ruby
bundle
bundle exec thin start
```
    

