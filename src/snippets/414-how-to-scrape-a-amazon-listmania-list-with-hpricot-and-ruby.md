---
id: '414'
title: How to scrape a Amazon Listmania list with Hpricot and Ruby
languages:
- ruby
tags:
- file
- perl
- replace
- search
---

```ruby
require 'open-uri'
require 'hpricot'
html =  open('http://www.amazon.com/Nick-Hornby-and-Company/lm/1X1GGDBXARHZ6/ref=cm_lm_toplist_fullview_1')

page = Hpricot(html)

xpath = "td[@class='listItem']//input[@name='asin.1']"

page.search(xpath).each do |book|
  puts book['value']
end
```
    

