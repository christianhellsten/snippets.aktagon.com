---
id: '456'
title: A random password generator for Ruby
languages:
- ruby
tags:
---
This is a simple random password generator for Ruby that allows you to customize the characters included in the password:


```ruby
CHARS = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
def random_password(length=10)
  CHARS.sort_by { rand }.join[0...length]
end
```
    

In this example, the generated passwords contain numbers, uppercase, and lowercase characters.

