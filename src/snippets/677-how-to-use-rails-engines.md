---
id: '677'
title: How to use Rails Engines
languages:
- ruby
tags:
---
Create a new engine named x:


```ruby
$ rails plugin new x --mountable
```
    

Load the engine by modifying Gemfile:


```ruby
gem 'x', path: 'engines/x'
```
    

Mount the engine as root in config/routes.rb:


```ruby
mount X::Engine => ”/”, as: ’root’
```
    

Optionally, allow the engine to override views and assets by adding this to config/application.rb:


```ruby
ApplicationController.prepend_view_path Rails.root.join('engines', 'x', 'app', 'views')

%w(stylesheets javascripts images).each do |dir|
  Rails.configuration.assets.paths.unshift Rails.root.join('engines', 'x', 'app', 'assets', dir)
end
```
    

Resources
---------

https://github.com/shageman/the\_next\_big\_thing
http://pivotallabs.com/migrating-from-a-single-rails-app-to-a-suite-of-rails-engines/
http://pivotallabs.com/unbuilt-rails-dependencies-how-to-design-for-loosely-coupled-highly-cohesive-components-within-a-rails-application/
http://pivotallabs.com/experience-report-engine-usage-that-didn-t-work/
http://assets.pivotallabs.com/1439/original/2012\_06\_12\_wrangling\_large\_rails\_codebases.pdf
http://microservices.io/patterns/monolithic.html

