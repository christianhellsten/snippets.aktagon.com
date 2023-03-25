---
id: '521'
title: Rails Memcached Status Plugin
languages:
- ruby
tags:
---
Use this Rack Middleware to check the status of memcached:


```ruby
require 'socket'

class MemcachedStatus
  def initialize(app, uri)
    @app = app
    @uri = uri
  end

  def call(env)
    if env['PATH_INFO'] == @uri
      status 
    else
      @app.call(env)
    end
  end
  
  def status
    socket = TCPSocket.open('localhost', '11211')
    socket.send("stats\r\n", 0)

    statistics = []
    loop do
      data = socket.recv(4096)
      if !data || data.length == 0
        break
      end
      statistics << data
      if statistics.join.split(/\n/)[-1] =~ /END/
        break
      end
    end

    out = "
<html>
<body>
<pre>
#{statistics.join}
</pre>
</body>
</html>
"
    [200, {"Content-Type" => "text/html"}, [out]]
  ensure
    socket.close
  end
end
```
    

Add the following to config/application.rb:


```ruby
config.middleware.use "MemcachedStatus", "/memcached_status"
```
    

Access status from http://localhost/memcached\_status

Socket code from <http://barkingiguana.com/2009/03/04/memcache-statistics-from-the-command-line/>

