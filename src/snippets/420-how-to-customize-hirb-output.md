---
id: '420'
title: How to customize Hirb output
languages:
- ruby
tags:
- extend
- rails
- scss
- sprockets
---
Only print id, created\_at and title for FeedItem class:


```ruby
Hirb.disable
  Hirb.enable :output => {
    "FeedItem"=>{
      :options=>{
        :fields=>%w{id created_at title}
      }
    }
  }
```
    

