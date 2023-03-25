---
id: '163'
title: Example of how to fetch a URL with Net:HTTP and Ruby
languages:
- ruby
tags:
- example
- golang
- polling
- postgres
---

```ruby
require 'net/http'
require 'net/https'

url = URI.parse('http://www.google.com/yo?query=yahoo')

http = Net::HTTP.new(url.host, url.port)

http.open_timeout = http.read_timeout = 10  # Set open and read timeout to 10 seconds
http.use_ssl = (url.scheme == "https")
       
headers = {
  'User-Agent'          => 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.12) Gecko/20080201 Firefox/2.0.0.12',
  'If-Modified-Since'   => '',
  'If-None-Match'       => ''
}

# Note to self, use request_uri not path: http://www.ruby-doc.org/core/classes/URI/HTTP.html#M004934
response, body = http.get(url.request_uri, headers)

puts response.code
puts response.message

response.each {|key, val| puts key + ' = ' + val}
```
    

