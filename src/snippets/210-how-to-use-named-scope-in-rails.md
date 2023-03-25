---
id: '210'
title: How to use named_scope in Rails
languages:
- ruby
tags:
- cron
- rspec
- whenever
---
Simple example of how to use the named\_scope feature:


```ruby
class Feed < ActiveRecord::Base
 
  named_scope :active, :conditions => "(active = 1)"
  named_scope :stale,  :conditions => ["last_updated > ?", 30.minutes.ago.to_s(:db)]
```
    

Usage:


```ruby
Feed.active # return the active feeds
```
    

Chaining is also possible:


```ruby
Feed.active.stale # return the feeds that need to be updated
```
    

