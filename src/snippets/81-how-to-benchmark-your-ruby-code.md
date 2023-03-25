---
id: '81'
title: How to benchmark your Ruby code
languages:
- ruby
tags:
- data
- postgres
- random
---
You can easily benchmark your Ruby code like this:


```ruby
require 'benchmark'
seconds = Benchmark.realtime do
	sleep 1
end
print "#{seconds} elapsed..."
```
    

The output should be close to 1 second.

