---
id: '559'
title: How to use Rack::Cache with Rails 3
languages:
- ruby
tags:
- bundler
- dockerfile
---
In Gemfile:


```ruby
# Rails 3 includes rack-cache, so this is not needed.
gem 'rack-cache'
```
    

In config/environments/production.rb:


```ruby
config.action_dispatch.rack_cache = {
    :metastore => "file:tmp/rack-cache/meta",
    :entitystore => "file:tmp/rack-cache/body",
    :verbose => true, # print debug information to log
    :allow_reload     => false, # allow user to force reload?
    :allow_revalidate => false, # allow user to force reload?
    :private_headers  => ['Cookie', 'Set-Cookie', 'Authorization'], # don't store these in the cache!
    :cache_key  =>  lambda { |request|
      Rack::Cache::Key.new(request).generate + ":jebus"
    }, # customize the cache key to make boss happy
    #:metastore   => 'memcached://localhost:11211/meta',
    #:entitystore   => 'memcached://localhost:11211/body'
  }
```
    

In app/controllers/application\_controller.rb:


```ruby
class ApplicationController < ActionController::Base
  def cache_for(ttl = 5.minutes)
    response.headers['Vary'] = 'Accept' # We want to cache JSON and HTML separately! NOTE this header varies between browsers, so not optimal...
    expires_in(ttl, :public => true) unless signed_in? # We don't want to cache content if user is signed in!
  end
```
    

Now you can cache all you want:


```ruby
def index
  cache_for(100.years)
  @data = BigData.all
end
```
    

Reference:
\* [Rack::Cache on Github](https://github.com/rtomayko/rack-cache)
\* [Vary Header for RESTful Applications](http://www.subbu.org/blog/2007/12/vary-header-for-restful-applications)

