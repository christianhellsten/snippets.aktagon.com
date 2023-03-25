---
id: '624'
title: Fix for "undefined method encoding' for nil:NilClass"
languages:
- ruby
tags:
---
This code:


```ruby
img src="/xyz/#{@house.address}"
```
    

Caused this:


```ruby
undefined method encoding' for nil:NilClass

/usr/local/rbenv/versions/2.0.0-p247/lib/ruby/2.0.0/cgi/util.rb in escape
    encoding = string.encoding
```
    

Why? Because address is nil and Slim tried to escape nil with CGI.escape, which doesn't work. The error was reported to be on line x when the error was on line y…

