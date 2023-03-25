---
id: '470'
title: 'How to fetch delicious data with Hpricot and OpenURI '
languages:
- ruby
tags:
---
The code:


```ruby
class Delicious
  class << self
    def tag(username, name, count = 15)
      links = []
      url = "http://feeds.delicious.com/v2/rss/#{username}/#{name}?count=#{count}"
      feed = Hpricot(open(url))

      feed.search("item").each do |i|
        item = OpenStruct.new
        item.link = i.at('link').next.to_s
        item.title = i.at('title').innerHTML
        item.description  = i.at('description').innerHTML rescue nil

        links << item
      end

      links
    end
  end
end
```
    

Usage:


```ruby
# Return last 15 items tagged with business and news from jebus's account:
Delicious.tag 'jebus', 'business+news', 15
```
    

Returns an array of items.

