---
id: '191'
title: Rolling back database migration one step in Rails
languages:
- ruby
tags:
---
[I found this](http://quotedprintable.com/2007/6/29/rake-db-rollback) awesome trick to rollback a Rails database migration one step. Add the following code to Rakefile.


```ruby
namespace :db do
  desc 'Rolls the schema back to the previous version. Specify the number of steps with STEP=n'
  task :rollback => :environment do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    version = ActiveRecord::Migrator.current_version - step
    ActiveRecord::Migrator.migrate('db/migrate/', version)
  end
end
```
    

And roll back with a breeze.


```ruby
rake db:migrate
rake db:rollback
```
    

