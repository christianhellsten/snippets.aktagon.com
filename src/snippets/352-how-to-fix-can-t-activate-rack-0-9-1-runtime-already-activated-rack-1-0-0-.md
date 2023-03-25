---
id: '352'
title: How to fix "can't activate rack (= 0.9.1, runtime), already activated rack-1.0.0"
languages:
- ruby
tags:
---
The current version of Sinatra (0.9.2) requires Rack version 0.9.1:


```ruby
require 'rubygems'
gem "rack", "0.9.1"
require 'sinatra'
```
    

