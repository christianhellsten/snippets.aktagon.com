---
id: '566'
title: How to crawl and scrape a site with Ruby and Anemone
languages:
- ruby
tags:
---
The code:


```ruby
require 'anemone'
require 'system_timer'

def spider(url, duration=60)
  options = { 
    :accept_cookies => true,
    :read_timeout => 20,
    :retry_limit => 0,
    :verbose => true,
    :discard_page_bodies => true,
    :user_agent => 'Mozilla...'
  }
  begin
    # Stop crawl after n seconds
    SystemTimer.timeout_after(duration) do
      Anemone.crawl(url, options) do |anemone|
        #anemone.storage = Anemone::Storage.MongoDB
        anemone.on_every_page do |page|
          puts page.url
          doc = page.doc
          yield doc if doc
        end
      end
    end
  rescue Timeout::Error
  end
end
```
    

How to use it:


```ruby
links = []
spider('http://cnn.com', 2*60) do |doc|
  links.concat doc.search('a').map{|e| e.inner_text}
end
links.uniq
```
    

See <http://anemone.rubyforge.org/information-and-examples.html>

