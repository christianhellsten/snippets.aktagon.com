---
id: '141'
title: How to perform a file upload (multipart post) with Ruby
languages:
- ruby
tags:
---
You have at least 5 options:

-   [Stanislav Vitvitskiy's solution](http://stanislavvitvitskiy.blogspot.com/2008/12/multipart-post-in-ruby.html)
-   RestClient


```ruby
require 'rest_client'
RestClient.post 'http://localhost:3000/foo', fields_hash.merge(:file => File.new('/path/to/file'))
```
    

-   The [curb gem](http://curb.rubyforge.org/)
-   The [multipart-post Net:HTTP extension](http://trac.caldersphere.net/projects/main/browser/multipart-post)
-   Calling curl from Ruby with, for example, [Open3](http://ruby-doc.org/stdlib/libdoc/open3/rdoc/index.html).


```ruby
Open3.popen3('curl  <and your parameters>') do |input, output, error|
# do something
end
```
    

