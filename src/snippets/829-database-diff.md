---
id: '829'
title: Database diff
languages:
- bash
- ruby
- yaml
tags:
---
This script will connect to two databases, named old and new, and print:
- the names of the tables that cannot be found in the new database
- the difference in the amount of rows per table, if there is a difference in the number of rows

db_diff.rb:
```ruby
#
# Postgres database diff script. Prints the names of missing tables and the
# difference in the amount of rows per table.
#
require 'sequel'
require 'pg'
require 'yaml'
require 'pry'

list_tables_sql = "SELECT tablename from pg_tables where schemaname = 'public';"
OLD_DB = Sequel.connect(YAML.load(File.read('old_database.yml')))
NEW_DB = Sequel.connect(YAML.load(File.read('new_database.yml')))
OLD_TABLES = OLD_DB[list_tables_sql].map{ |x| x.fetch(:tablename) }
NEW_TABLES = NEW_DB[list_tables_sql].map{ |x| x.fetch(:tablename) }

# Compare tables
def diff_tables
  OLD_TABLES - NEW_TABLES
end

# Compare row count
def diff_row_count
  OLD_TABLES.sort.reduce({}) do |hash, table|
    sql = "SELECT count(*) FROM %{table}"
    # Sequel's count method does not work.
    diff = OLD_DB[sql % {table: table}].first[:count].to_i - NEW_DB[sql % {table: table}].first[:count].to_i
    hash[table] = diff if diff != 0
    hash
  end
end

puts JSON.pretty_generate(tables: diff_tables, rows: diff_row_count)
```

Gemfile:
```ruby
source 'https://rubygems.org'

gem 'sequel'
gem 'pg'
gem 'pry'
```

new_database.yml and old_database.yml:
```yaml
adapter: postgres
host: localhost
port: 5432
encoding: unicode
database: x_production
username: x
password: x
```

To run the script:

```bash
gem install bundler
bundle
bundle exec ruby db_diff.rb
```


## Other migration and diff tools

- https://github.com/djrobstep/migra

> migra is a schema diff tool for PostgreSQL. Use it to compare database schemas or autogenerate migration scripts.

- https://github.com/eulerto/pgquarrel

> Given two database connections, it output a file that represent the difference between schemas. It means that if you run the output file into the from database, it'll have the same schema as the to database.

- https://github.com/joncrlsn/pgdiff

> Compares the PostgreSQL schema between two databases and generates SQL statements that can be run manually against the second database to make their schemas match.

