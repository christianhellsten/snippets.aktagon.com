---
id: '697'
title: Unescaping HTML entities in Ruby
languages:
- ruby
tags:
---
Example of how to unescape HTML entities and convert them to text with Nokogiri:


```ruby
Nokogiri::HTML.fragment(’&copy;&nbsp;&auml;&ouml;') => © äö
```
    

There's also the html-entities ruby gem.

