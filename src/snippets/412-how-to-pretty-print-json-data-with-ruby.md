---
id: '412'
title: How to pretty print JSON data with Ruby
languages:
- ruby
tags:
- grant
- postgresql
- wtf
---
This ugly one-liner will pretty print the JSON in countries.json, so that it's easier to read and edit:


```ruby
cat db/seeds/countries.json | ruby -rubygems -e 'require "json";a=JSON.pretty_generate JSON.parse gets;File.open("db/seeds/countries.json", "w"){|f| f << a}'
```
    

