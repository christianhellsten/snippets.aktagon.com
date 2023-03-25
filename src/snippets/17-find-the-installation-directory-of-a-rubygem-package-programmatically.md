---
id: '17'
title: Find the installation directory of a RubyGem package programmatically
languages:
- ruby
tags:
---
This snippet prints the full path to the Rails installation directory--the path is retrieved using the [RubyGems](http://rubygems.org/) API:


```ruby
require 'rubygems'
puts Gem.cache.search('rails').first.full_gem_path
# Specify version number
puts Gem.cache.search('rails', '=1.0.0').first.full_gem_path
```
    

Example output:


```ruby
/usr/lib/ruby/gems/1.8/gems/rails-1.0.0
```
    

To find the directory where your gems are hiding, use:


```ruby
gem env
```
    

There's also the **gem which** command:


```ruby
$ gem which activesupport
(checking gem activesupport-2.3.2 for activesupport)
/opt/ruby-enterprise-1.8.6-20090201/lib/ruby/gems/1.8/gems/activesupport-2.3.2/lib/activesupport.rb
```
    

