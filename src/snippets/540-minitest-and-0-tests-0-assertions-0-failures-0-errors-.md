---
id: '540'
title: MiniTest and "0 tests, 0 assertions, 0 failures, 0 errors"
languages:
- ruby
tags:
---
My test\_helper.rb looked like this:


```ruby
require 'minitest/autorun'
require 'app'
```
    

The output when running a unit test was this:


```ruby
0 tests, 0 assertions, 0 failures, 0 errors
```
    

The solution was to move the minitest require:


```ruby
require 'minitest/autorun'
require 'app'
```
    

Now my tests are run again when executing:


```ruby
ruby test/functional/xxx_controller_test.rb
```
    

