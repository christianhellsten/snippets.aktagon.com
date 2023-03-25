---
id: '698'
title: How to run only one specific test with Rspec
languages:
- ruby
tags:
---
Focusing on one or more tests with Rspec
----------------------------------------

You can tell Rspec to run only tests tagged with "focus: true" by running Rspec with the **--tag focus** switch:


```ruby
rspec ./spec/controllers/concerns/session_expiry_spec.rb --tag focus
```
    

This would run e.g. only this test which is marked with [focus: true]()


```ruby
it "resets session if session has expired", focus: true do
...
end
```
    

Integrating with Guard
----------------------

Use this configuration to integrate this workflow with Guard:


```ruby
guard 'rspec', cli: '--tag focus --format d --color', all_after_pass: false, all_on_start: false do
...
end
```
    

We also want to run all tests when there are no focused tests. We therefore add this to **spec/spec\_helper.rb**:


```ruby
RSpec.configure do |config|
  # This is dangerous with CI integration e.g. Jenkins
  # config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
```
    

Rspec configuration file
------------------------

One alternative is to enable the focus option in the Rspec configuration file:


```ruby
RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
```
    

However, this would be dangerous when running tests with e.g. Jenkins and when someone forgets to remove "focus: true".

