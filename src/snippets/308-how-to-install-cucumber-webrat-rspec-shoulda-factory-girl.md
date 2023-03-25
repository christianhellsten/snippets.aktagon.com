---
id: '308'
title: How to install cucumber, webrat, rspec, shoulda, factory_girl
languages:
- ruby
tags:
- code
- exit
- status
---
In config/environments/test.rb:


```ruby
config.gem 'cucumber', :lib => false
config.gem 'webrat', :lib => false
config.gem 'rspec', :lib => false
config.gem 'rspec-rails', :lib => false
config.gem 'thoughtbot-shoulda',
           :lib    => false,
           :source => 'http://gems.github.com'
config.gem 'thoughtbot-factory_girl',
           :lib    => false,
           :source => "http://gems.github.com"
```
    

Then from the command line:


```ruby
rake gems:install RAILS_ENV=test
```
    

Then put the following in features/env.rb:


```ruby
require 'factory_girl'
require 'spec/factories' 
require 'shoulda'
```
    

