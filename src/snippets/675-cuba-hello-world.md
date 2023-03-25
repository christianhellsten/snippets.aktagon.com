---
id: '675'
title: Cuba Hello World
languages:
- ruby
tags:
---
<http://cuba.is/>

app.rb:


```ruby
require "cuba"
#require "rack/protection"

#Cuba.use Rack::Session::Cookie, :secret => "__a_very_long_string__"
#Cuba.use Rack::Protection

Cuba.define do
  # only GET requests
  on get do
    # /
    on root do
      res.write "Home"
    end
  end
end
```
    

config.ru:


```ruby
require "./app"
require 'sprockets'

map '/assets' do
  env = Sprockets::Environment.new
  env.append_path 'assets/javascripts'
  env.append_path 'assets/stylesheets'
  env.append_path 'assets/images'
  run env
end

run Cuba
```
    

Gemfile:


```ruby
source 'https://rubygems.org'
gem 'cuba'
gem 'sprockets'
gem 'puma'
```
    

Anonymous hello world benchmark:


```ruby
Node.js - 27 000 req/s
Ruby cuba - 17 000 req/s
Ruby hobbit - 17 000 req/s
Ruby rack - 25 000 req/s
```
    

Yes, Ruby is very slow.

