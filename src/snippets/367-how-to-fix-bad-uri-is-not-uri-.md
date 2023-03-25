---
id: '367'
title: How to fix "bad URI(is not URI?)"
languages:
- ruby
tags:
---
This URL contains special characters, which Ruby can't handle:


```ruby
>> URI.parse 'http://www.yr.no/sted/Finland/Västra_Finland/Askainen/varsel.xml'
URI::InvalidURIError: bad URI(is not URI?): http://www.yr.no/sted/Finland/Västra_Finland/Askainen/varsel.xml
	from /usr/local/lib/ruby/1.8/uri/common.rb:436:in split'
	from /usr/local/lib/ruby/1.8/uri/common.rb:485:in parse'
	from (irb):5
```
    

Your browser can probably open the URL. To fix this error encode the URL before handing it to the parse method:


```ruby
URI.parse(URI.encode('http://www.yr.no/sted/Finland/Västra_Finland/Askainen/varsel.xml'))
=> #<URI::HTTP:0x18bfb40 URL:http://www.yr.no/sted/Finland/V%C3%A4stra_Finland/Askainen/varsel.xml>
```
    

