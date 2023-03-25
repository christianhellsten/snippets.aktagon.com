---
id: '535'
title: How to use the Disqus API with Ruby
languages:
- ruby
tags:
---

```ruby
require 'httparty'

# See http://disqus.com/api/docs/
module Disqus
  class Base
    include HTTParty
    format :json
    base_uri 'http://disqus.com/api/3.0'
    debug_output $stderr
  end

  class Forum < Base
    # http://disqus.com/api/docs/forums/create/
    def create(options)
      url = "/forums/create.json"
      self.class.post(url, :body => options.merge({ :api_secret => API_SECRET }))
    end

    def posts(id)
      url = "/forums/listPosts.json?api_secret=#{API_SECRET}&forum=#{id}"
      self.class.get(url)
    end

    def threads(id)
      url = "http://disqus.com/api/3.0/threads/list.json?api_secret=#{API_SECRET}&forum=#{id}"
      self.class.get(url)
    end
  end

  class Post < Base
    # http://disqus.com/api/docs/posts/create/
    def create(message)
      url = "/posts/create.json"
      self.class.post(url, :body => message.merge({ :api_secret => API_SECRET }))
    end
  end
end

# Secret key from http://disqus.com/api/applications/
Disqus::API_SECRET = '...'
```
    

