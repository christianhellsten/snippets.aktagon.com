---
id: '394'
title: How to generate URLs in your Rails model
languages:
- ruby
tags:
- growth
- hypothesis
- marketing
- method
- research
- scientific
- testing
---
You can use helpers in your model by first including them:


```ruby
class Post < ActiveRecord::Base
  include ActionController::UrlWriter
  def to_uri
     post_path(self)
  end
end
```
    

Some might consider this heresy, I don't. In my opinion it's similar to the to\_param method. You could of course move it to a delegate class or something similar.

