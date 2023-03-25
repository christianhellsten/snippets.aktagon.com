---
id: '589'
title: Email validation in Rails and ActiveRecord
languages:
- ruby
tags:
- celery
- tips
---

```ruby
class User < ActiveRecord::Base
  validates :email, format: { with: /@/ }, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 254 }
end
```
    

Inspired by <http://davidcelis.com/blog/2012/09/06/stop-validating-email-addresses-with-regex/>

