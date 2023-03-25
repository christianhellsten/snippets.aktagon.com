---
id: '290'
title: Parsing feeds with Ruby and rFeedParser
languages:
- ruby
tags:
---
[rFeedParser](http://github.com/jmhodges/rfeedparser/tree/master) is a Ruby version of the [feedparser Python library](http://feedparser.org), which is probably the best (not fastest) feed parser.

To install it follow the instruction on the [project's GitHub page](http://github.com/jmhodges/rfeedparser/tree/master).


```ruby
require 'rubygems'
require 'rfeedparser'
require 'benchmark'


seconds = Benchmark.realtime do

	body = File.read('example-feed.xml')
	
	for num in (1..500)
		feed = FeedParser.parse(body) # Can be URL, string, data.
	end
	
end

puts "#{seconds.round} elapsed."
```
    

rFeedParser has one problem. In my simple test it was ~3-4 times slower than feed-normalizer and feedparser.org.

