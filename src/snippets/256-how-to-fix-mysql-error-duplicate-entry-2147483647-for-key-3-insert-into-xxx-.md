---
id: '256'
title: 'How to fix "Mysql::Error: Duplicate entry ''2147483647'' for key 3: INSERT
  INTO xxx"'
languages:
- ruby
tags:
- ansible
- setgid
- setuid
---
2147483647 is the maximum for an integer column in MySQL, so this error probably means you've exceeded this limit somewhere in your code.

Rails automatically detects the best type for your columns, so be sure to specify the correct limit when creating the column with migrations:


```ruby
# from activerecord-2.1.1/lib/active_record/connection_adapters/mysql_adapter.rb
        case limit
        when 1; 'tinyint'
        when 2; 'smallint'
        when 3; 'mediumint'
        when nil, 4, 11; 'int(11)'  # compatibility with MySQL default
        when 5..8; 'bigint'
        else raise(ActiveRecordError, "No integer type has byte size #{limit}")
        end
```
    

This Rails migration code would create a big integer column:


```ruby
t.integer :product_id, :null => false, :limit => 8
```
    

See [the section on Numeric Types](http://dev.mysql.com/doc/refman/5.1/en/numeric-types.html) in the MySQL documentation for more information.

