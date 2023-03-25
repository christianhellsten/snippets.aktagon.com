---
id: '408'
title: Simple Webrick proxy.
languages:
- ruby
tags:
- lateral
- loop
- postgres
---
A handy oneliner which I found [here](http://www.ruby-forum.com/topic/139859).


```ruby
ruby -r webrick/httpproxy -e 's = WEBrick::HTTPProxyServer.new(:Port => 9999, :RequestCallback => Proc.new{|req,res| puts req.request_line, req.raw_header}); trap("INT"){s.shutdown}; s.start'
```
    

