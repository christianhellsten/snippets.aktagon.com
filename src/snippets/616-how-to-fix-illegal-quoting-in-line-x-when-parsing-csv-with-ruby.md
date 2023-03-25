---
id: '616'
title: How to fix "Illegal quoting in line x" when parsing CSV with Ruby
languages:
- ruby
tags:
- attachshadow
- dom
- root
- shadow
- shadowroot
---
To fix the illegal quoting issue, use a quote\_char that is not in your data:


```ruby
CSV.open('data.csv', quote_char: "\x00", col_sep: "\t").each do |s|
end
```
    

Use double quotes around \\x00, otherwise you'll get:


```ruby
:quote_char has to be a single character String
```
    
You can also try the "liberal_quoting" option available in Ruby 2.4, and specifying the correct quote_char...
