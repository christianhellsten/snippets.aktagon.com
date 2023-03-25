---
id: '719'
title: Using Ruby 2.2.0 with Rails 3.x
languages:
- ruby
tags:
---
Steps for upgrading a Rails 3.x app to Ruby 2.2.0:

1.  Install Ruby 2.2.0, e.g. brew update; brew upgrade ruby-build; rbenv install 2.2.0
2.  Set app's ruby version to 2.2.0, e.g. rbenv local 2.2.0
3.  Update gems that are broken, e.g. bundle update pg eventmachine rubocop
4.  Add test-unit to Gemfile to fix "cannot load such file — test/unit/testcase (LoadError)" error:


```ruby
gem 'test-unit'
```
    

1.  Rollback to 2.1 when you notice all warnings, related to e.g. Comparable, or continue with the warnings


