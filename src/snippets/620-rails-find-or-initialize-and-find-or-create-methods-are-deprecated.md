---
id: '620'
title: Rails find_or_initialize and find_or_create methods are deprecated
languages:
- ruby
tags:
---
The find\_or\_initialize and find\_or\_create methods have been deprecated in Rails x.x.x. This is what you need to do:


```ruby
Before:
User.find_or_create_by_name('XXX')

After:
User.find_or_create_by(name: 'XXX')

Before:
User.find_or_initialize_by_name('XXX')

After:
User.where(name: 'XXX').first_or_initialize
```
 
If you want the old methods, see <https://github.com/rails/activerecord-deprecated_finders>.

Also see <http://apidock.com/rails/ActiveRecord/Relation/first_or_create>

