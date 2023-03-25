---
id: '488'
title: Ruby Regular expression examples
languages:
- ruby
tags:
---

```ruby
# extract xxx
text = "{{xxx}}"
if text[/\{\{(.*)?\}\}/]
  xxx = $1
end

# extract all headers from a raw Wikipedia article
# example:
# ==Banks==
# ===Fraud===
# ===Corruption===
# \1 = back reference
headers = text.scan(/^(={1,5})(.+?)\1$/m).inject([]) do |result, m|
  header = OpenStruct.new(:depth => m[0].length, :title => m[1])
  result << header
  print ("    "*header.depth) + header.title + "\n"
  result
end
```
    

