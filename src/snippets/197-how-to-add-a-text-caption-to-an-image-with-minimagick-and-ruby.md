---
id: '197'
title: How to add a text caption to an image with MiniMagick and Ruby
languages:
- ruby
tags:
- go
- golang
- ssh
---

```ruby
require 'rubygems'
require 'mini_magick'

img = MiniMagick::Image.from_file("jpeg.jpg")

img.combine_options do |c|
  c.gravity 'Southwest'
  c.draw 'text 10,10 "whatever"'
  c.font '-*-helvetica-*-r-*-*-18-*-*-*-*-*-*-2'
  c.fill("#FFFFFF")
end

img.write("new.jpg")
```
    

