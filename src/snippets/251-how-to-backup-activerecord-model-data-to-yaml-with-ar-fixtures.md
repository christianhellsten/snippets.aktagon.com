---
id: '251'
title: How to backup ActiveRecord model data to YAML with ar_fixtures
languages:
- ruby
tags:
---
First install the plugin:


```ruby
script/plugin install http://github.com/mileszs/ar_fixtures/commits/master
```
    

Then dump data for all models with:


```ruby
rake db:data:dump:all
```
    

There's a task for loading the data into the database, see rake -T for more information.

You can also do this without a plugin by using ActiveSupport::JSON and File.write to [seed your database](http://snippets.aktagon.com/snippets/401-How-to-seed-your-database-with-JSON-YAML-data-in-Rails-2-3-4).

