---
id: '472'
title: How to generate HAML views for Devise
languages:
- ruby
tags:
- docker
- elasticsearch
- gotcha
- iptables
- ufw
- wtf
---
This will generate HAML views with Rails 3, HAML &gt;=3.0.18 ([won't work with lower version](https://rails.lighthouseapp.com/projects/8994-ruby-on-rails/tickets/5493-form_for-silently-failing-with-rails-300#ticket-5493-13)), and the latest devise version:


```ruby
$ rails generate devise:views -e haml
```
    

If you see the following error when running the command:


```ruby
Required dependency ruby_parser not found!
    Run "gem install ruby_parser" to get it.
Required dependency hpricot not found!
    Run "gem install hpricot" to get it.
```
    

make sure you have the following dependencies in Gemfile:


```ruby
group :development do
  gem 'hpricot'
  gem 'ruby_parser'
end
```
    

