---
id: '164'
title: 'How to use Ruby and SimpleRSS to parse RSS and Atom feeds '
languages:
- ruby
tags:
---
This script is an example of how to use the SimpleRSS gem to parse an RSS feed.

The script can easily be modified to support conditional gets. It also detects the feed's character encoding and converts the feed to UTF-8.


```ruby
require 'iconv'
require 'net/http'
require 'net/https'
require 'rubygems'
require 'simple-rss'

url = URI.parse('http://hbl.fi/rss.xml')

http = Net::HTTP.new(url.host, url.port)

http.open_timeout = http.read_timeout = 10  # Set open and read timeout to 10 seconds
http.use_ssl = (url.scheme == "https")

headers = {
  'User-Agent'          => 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.12) Gecko/20080201 Firefox/2.0.0.12',
  'If-Modified-Since'   => 'store in a database and set on each request',
  'If-None-Match'       => 'store in a database and set on each request'
}

response, body = http.get(url.path, headers)

encoding = body.scan(
/^<\?xml [^>]*encoding="([^\"]*)"[^>]*\?>/
).flatten.first

if encoding.empty?
	if response["Content-Type"] =~ /charset=([\w\d-]+)/
		puts "Feed #{url} is #{encoding} according to Content-Type header"
		encoding = $1.downcase
	else
		puts "Unable to detect content encoding for #{href}, using default."
		encoding = "ISO-8859-1"
	end
else
	puts "Feed #{url} is #{encoding} according to XML"
end

# Use 'UTF-8//IGNORE', if this throws an exception
ic = Iconv.new('UTF-8', encoding)
body = ic.iconv(body)

feed = SimpleRSS.parse(body)

for item in feed.items
  puts item.title
end
```
    

