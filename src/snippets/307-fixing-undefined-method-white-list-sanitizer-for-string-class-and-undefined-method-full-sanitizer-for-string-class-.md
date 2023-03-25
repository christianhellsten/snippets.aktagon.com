---
id: '307'
title: Fixing "undefined method white_list_sanitizer' for String:Class" and "undefined
  method full_sanitizer' for String:Class"
languages:
- ruby
tags:
---
If you get one of these errors, it's highly likely that you've upgraded to Rails 2.2 or higher:


```ruby
undefined method white_list_sanitizer' for String:Class
undefined method full_sanitizer' for String:Class
```
    

The fix is to extend the SanitizeHelper.


```ruby
class String
  extend ActionView::Helpers::SanitizeHelper::ClassMethods
end
```
    

