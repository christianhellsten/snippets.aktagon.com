---
id: '459'
title: How to test modular Sinatra apps with Rack::Test
languages:
- ruby
tags:
---
Let's say you have this in your config.ru:


```ruby
run Rack::URLMap.new \
  "/" => HomeController.new,
  "/user" => UserController.new
```
    

and you want to test both / and /user at the same time.

The solution is to return an instance of Rack::Builder instead of, for example, HomeController, which this snippet does by reading config.ru and evaluating it:


```ruby
def app
  eval "Rack::Builder.new {( " + File.read(File.dirname(__FILE__) + '/../config.ru') + "\n )}"
end
```
    

The code was found on [the internets](https://gist.github.com/28d510d9fc25710192bc) and might not work if Sinatra/Rack is changed.

How to test one controller in isolation
---------------------------------------

To test just one controller use this code:


```ruby
def app
    Rack::Builder.new do
      run ProductsController
    end
end
```
    

or even simpler:


```ruby
def app
    ProductsController
end
```
    

