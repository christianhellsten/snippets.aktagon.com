---
id: '694'
title: How to Use the JSON and HStore Postgres Data Types With Rails 4
languages:
- ruby
tags:
---
First enable the hstore Postgres extension. In this example we define both a JSON and an HStore column:


```ruby
class Schema < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    create_table :links do |t|
      t.hstore :data
      t.column :settings, :json
    end
  end
end
```
    

Next, we specify accessors for the data that we will be stored in the JSON and HStore columns:


```ruby
class Link < ActiveRecord::Base
  # Use hstore for text-only data:
  store :data, :name, :url, :description
  # Use JSON to support string, number, object, array, true, false, null
  store :settings, :update_interval, :created_at, :updated_at
```
    

We can now use the defined ActiveRecord attributes to store and access JSON and HStore data:


```ruby
Link.create! name: 'Google', url: 'http://google.com', description: 'Ad company', update_interval: 1.day, created_at: Time.now.utc
```
    

Querying the data is where you'll see the biggest differences. Two examples:


```ruby
# hstore
Link.where("data -> 'name' = ?", 'Google')
# json
Link.where("CAST(settings->>'update_interval' as integer) = ?", 1.day.to_s)
```
    

Notes for Postgres 9.3:
\* HStore can store only text. Nested data is not supported.
\* [JSON supports](http://json.org/) the following types: string, number, object, array, true, false, null. For example, date and time types are not supported. Nested data is supported.

