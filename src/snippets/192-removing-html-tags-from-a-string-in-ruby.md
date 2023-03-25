---
id: '192'
title: Removing HTML tags from a string in Ruby
languages:
- ruby
tags:
---
I don't take credit for the regexp. The source for it is Mastering Regular Expressions by Jeffrey E.F. Frield.


```ruby
def remove_html_tags
    re = /<("[^"]*"|'[^']*'|[^'">])*>/
    self.title.gsub!(re, '')
    self.description.gsub!(re, '')
  end
```
    

