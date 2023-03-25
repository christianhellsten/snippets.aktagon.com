---
id: '400'
title: "How to fix Shoulda's â\x80\x9CCan't find first xxxâ\x80\x9D problem"
languages:
- ruby
tags:
- bunny
- confirms
- publisher
- rabbitmq
---
In the following example, Shoulda's should\_validate\_uniqueness\_of might throw an “Can't find first” error:


```ruby
class PostTest < ActiveSupport::TestCase
  should_validate_uniqueness_of :title
```
    

To fix it add a subject to the test:


```ruby
class PostTest < ActiveSupport::TestCase
  subject { Factory(:post) }
  should_validate_uniqueness_of :title
```
    

