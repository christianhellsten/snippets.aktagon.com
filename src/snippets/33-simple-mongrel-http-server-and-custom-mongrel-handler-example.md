---
id: '33'
title: Simple Mongrel HTTP server and custom Mongrel handler example
languages:
- ruby
tags:
---

```ruby
# http://mongrel.rubyforge.org/rdoc/index.html
# gem install -y mongrel
require 'rubygems'
require 'mongrel'

# Usage: ruby mongrel_http_server.rb <host> <port> <docroot>
host    = ARGV[0] || "127.0.0.1"
port    = ARGV[1] || 80
docroot = ARGV[2] || "html/"

# Simple Mongrel handler that prints the current date and time
class HandlerExample < Mongrel::HttpHandler
   def process(request, response)
      response.start(200) do |head, out|
         head["Content-Type"] = "text/html"
         out.write Time.now
      end
   end
end

# Configure Mongrel and handlers
config = Mongrel::Configurator.new :host => host, :port => port do
  listener do
    uri "/",              :handler => Mongrel::DirHandler.new(docroot)
    uri "/handler_example", :handler => HandlerExample.new, :in_front => true
  end

  # CTRL+C to stop server
  trap("INT") { stop }
  run
end

# Start Mongrel
puts "Mongrel listening on '#{host}:#{port}', serving documents from '#{docroot}'."
config.join
```
    

