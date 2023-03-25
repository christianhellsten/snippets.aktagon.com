---
id: '78'
title: How to install the exception_logger Rails plugin and protect the logs with
  basic authentication
languages:
- ruby
tags:
---
This snippet explains how to install and use the Rails exception\_logger plugin. I'll also show you how to protect your logs by extending the plugin with basic authentication.


```ruby
script/plugin source http://svn.techno-weenie.net/projects/plugins
script/plugin install exception_logger
```
    

I'm using Rails Edge on this project, so I had to install classic pagination also:


```ruby
script/plugin install svn://errtheblog.com/svn/plugins/classic_pagination
```
    

Next create and execute the migration file:


```ruby
./script/generate exception_migration
rake db:migrate
```
    

Before starting the server we need to setup the routes:


```ruby
map.exceptions '/logged_exceptions/:action/:id', :controller => 'logged_exceptions', :action => 'index', :id => nil
```
    

You also need to include the ExceptionLoggable in your ApplicationController:


```ruby
class ApplicationController < ActionController::Base
  include ExceptionLoggable
...
```
    

Start your server and access the exception log at /logged\_exceptions.

Exceptions can contain email addresses, passwords, credit card numbers, so you'll want to protect /logged\_exceptions from the public. This can be done by adding the following code to the end of environment.rb:


```ruby
config.after_initialize do
  require 'application' unless Object.const_defined?(:ApplicationController)
  LoggedExceptionsController.class_eval do
    before_filter :authenticate

    protected

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "foo" && password == "bar"
      end
    end
  end
end
```
    

With this code we add a before filter that shows a login dialog to anyone trying to access /logged\_exception/. Note that this requires Rails 2.0 basic authentication to work, so make sure you have the proper version installed.

