---
id: '257'
title: How to use ActiveRecord without Rails
languages:
- ruby
tags:
---
This is an example of how to use ActiveRecord without Rails. Tested with Rails 6.

## Short version

```ruby
require 'active_record'
require 'pg' # postgresql

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  encoding: "unicode",
  database: "matrix",
  username: "postgres",
  password: ""
)

class User < ActiveRecord::Base
end
```


## Similar-to-Rails version

app.rb:

```ruby
require 'pg' # postgresql
require 'erb'
require 'yaml'
require 'active_record'

APP_ENV = ENV.fetch('APP_ENV', 'development')

ActiveRecord::Base.schema_format = :sql
ActiveRecord::Base.logger = Logger.new($stdout)
ActiveRecord::Base.configurations = YAML.load(ERB.new(File.read('config/database.yml')).result)
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[APP_ENV])

class User < ActiveRecord::Base
end
```
    

db/migrate/001\_schema.rb


```ruby
class Schema < ActiveRecord::Migration
  def change
    create_table :users, force: true do |t|
      t.string :name
    end
  end
end
```
    

Rakefile:


```ruby
task :environment do
  RAKE_PATH = File.expand_path('.')
  RAKE_ENV  = ENV.fetch('APP_ENV', 'development')
  ENV['RAILS_ENV'] = RAKE_ENV

  Bundler.require :default, RAKE_ENV

  ActiveRecord::Tasks::DatabaseTasks.database_configuration = ActiveRecord::Base.configurations
  ActiveRecord::Tasks::DatabaseTasks.root             = RAKE_PATH
  ActiveRecord::Tasks::DatabaseTasks.env              = RAKE_ENV
  ActiveRecord::Tasks::DatabaseTasks.db_dir           = 'db'
  ActiveRecord::Tasks::DatabaseTasks.migrations_paths = ['db/migrate']
  ActiveRecord::Tasks::DatabaseTasks.seed_loader      = OpenStruct.new(load_seed: nil)
end

# Use Rails 6 migrations
load 'active_record/railties/databases.rake'
```
    

**database.yml**:


```ruby
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: <%= ENV.fetch('DB_HOST') %>
  username: <%= ENV.fetch('DB_USER') %>
  password: <%= ENV.fetch('DB_PASSWORD') %>
  port: <%= ENV.fetch('DB_PORT', 5432) %>
  schema_search_path: public

development:
  <<: *default
  database: app_development
```
    
References:
https://api.rubyonrails.org/classes/ActiveRecord/Tasks/DatabaseTasks.html
