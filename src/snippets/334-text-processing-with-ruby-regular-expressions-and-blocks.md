---
id: '334'
title: Text processing with Ruby regular expressions and blocks
languages:
- ruby
tags:
- cidr
- ip
- ipv4
- ipv6
- private
- validate
---
This example will find all code tags and pass the lang attribute's value and the code block's content to the block:


```ruby
output = r.gsub(/<code[\.|\:]([\w\-]+)>(.*?)<\/code[\.|\:]?\1?>/m) do
       lang, text = $1, $2
       html = "<notextile>" + text +  "</notextile>"
end.to_html
```
    

The block's return value will replace the found tag.

