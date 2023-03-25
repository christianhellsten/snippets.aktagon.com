---
id: '208'
title: How to parse an RSS or Atom feed with Python and the Universal Feed Parser
  library
languages:
- python
tags:
- go
- xml
---
This example uses the [Universal Feed Parser](http://feedparser.org/), one of the best and fastest parsers for Python.

Feed Parser is a lot faster than feed\_tools for Ruby and it's about as fast as the ROME Java library according to my simple benchmark.

Feed Parser uses less memory and about as much of the CPU as ROME, but this wasn't tested with a long running process, so don't take my word for it.


```python
import time
import feedparser

start = time.time()

feeds = [
	'http://..', 
	'http://'
]

for url in feeds:
  options = {
    'agent'   : '..',
    'etag'    : '..',
    'modified': feedparser._parse_date('Sat, 29 Oct 1994 19:43:31 GMT'),
    'referrer' : '..'
  }

  feed = feedparser.parse(url, **options)

  print len(feed.entries)
  print feed.feed.title.encode('utf-8')

end = time.time()

print 'fetch took %0.3f s' % (end-start)
```
    

