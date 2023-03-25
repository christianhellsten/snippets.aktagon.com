---
id: '596'
title: How to override attr_accessible and allow mass-assignment
languages:
- ruby
tags:
---
[RTFM](http://api.rubyonrails.org/classes/ActiveRecord/Base.html#method-c-new)


```ruby
# Via roles
User.new({ :first_name => 'Jamie', :is_admin => true }, :as => :admin)
# Via without_protection
User.new({ :first_name => 'Jamie', :is_admin => true }, :without_protection => true)
```
    

