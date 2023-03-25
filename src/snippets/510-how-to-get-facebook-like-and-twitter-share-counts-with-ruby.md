---
id: '510'
title: How to get Facebook like and Twitter share counts with Ruby
languages:
- ruby
tags:
- namespace
- singular_route_key
---

```ruby
def facebook_likes(url)
    data = open("http://graph.facebook.com/?ids=#{URI.escape(url)}").read
    data = JSON.parse(data)
    data[url]['shares']
  end

  def twitter_shares(url)
    data = open("http://urls.api.twitter.com/1/urls/count.json?url=#{URI.escape(url)}").read
    data = JSON.parse(data)
    data['count']
  end
```
    

