---
id: '92'
title: List all links in a file with Ruby and regular expressions
languages:
- ruby
tags:
---
This snippet lists all text links:


```ruby
data = File.read('the_link_collection.txt')

links = data.scan /href="([^"]*)[^>]*>([^<]*)<\/a>/im

links.each do |link|
  puts "#{link[1].chomp} = #{link[0]}"
end
```
    

