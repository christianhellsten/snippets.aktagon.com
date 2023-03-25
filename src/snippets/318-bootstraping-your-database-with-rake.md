---
id: '318'
title: Bootstraping your database with rake
languages:
- ruby
tags:
- cucumber
---
In lib/tasks/app.rake:


```ruby
namespace :db do
  desc "Bootstraps the database"
  task :bootstrap => ['db:schema:load'] do

   { 'Ruby' => 'ruby',
      'JavaScript' => 'javascript',
    }.each do |name, short_name|
      Category.create!(:name => name, :short_name => short_name)
    end

  end
end
```
    

