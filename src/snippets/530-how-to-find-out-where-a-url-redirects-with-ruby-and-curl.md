---
id: '530'
title: How to find out where a URL redirects with Ruby and Curl
languages:
- ruby
tags:
---

```ruby
text = %x[curl -L -i "http://theredirectingurl.com"]
url = text.scan(/Location: ([^\n]+)/).flatten.last
```
    

With the Curb wrapper for Curl you could do this:


```ruby
result = Curl::Easy.perform(link) do |curl| 
  curl.headers["User-Agent"] = "..."
  curl.verbose = true
  curl.follow_location = true
end
result.last_effective_url # Returns the final destination URL after x redirects...
result.url # Returns the original url which is redirecting...
```
    

