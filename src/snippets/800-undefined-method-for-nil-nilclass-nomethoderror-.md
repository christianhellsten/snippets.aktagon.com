---
id: '800'
title: undefined method `+' for nil:NilClass (NoMethodError)
languages:
- ruby
tags:
---
When Capybara/Cucumber tests fail:

```ruby
undefined method `+' for nil:NilClass (NoMethodError)
.../.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/minitest-5.10.1/lib/minitest/assertions.rb:135:in `assert'
```

Do this:

1. Install test-unit

```ruby
gem 'test-unit'
```

2. Include assertions in env.rb

```ruby
World Test::Unit::Assertions
```
