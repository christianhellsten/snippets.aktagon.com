---
id: '196'
title: How to add a watermark to pictures with MiniMagick and Ruby
languages:
- ruby
tags:
---
This code can be used to add a watermark to pictures:


```ruby
require 'rubygems'
require 'mini_magick'

# Read the image
img = MiniMagick::Image.from_file("the_picture.jpg")

# 0,0 0,0 = add the watermark at coordinates: x, y, set watermark size to auto with 0,0
img.draw 'image Over 0,0 0,0 "the_watermark.gif"'

img.write("watermarked_image.jpg")
```
    

How to add a watermark to the bottom-left corner?
-------------------------------------------------

To add a watermark to the bottom-left corner, you need to use the combine\_options method to pass more than one command plus parameters to MiniMagick (gravity and draw commands):


```ruby
require 'rubygems'
require 'mini_magick'

img = MiniMagick::Image.from_file("the_image.jpg")

img.combine_options do |c|
  c.gravity 'SouthWest'
  c.draw 'image Over 0,0 0,0 "the_watermark.gif"'
end

img.write("new.jpg")
```
    

Troubleshooting
---------------

See [mogrify's documentation](http://www.imagemagick.org/script/command-line-options.php#draw) for details on how to use the draw command.

If you get this error it might mean that mogrify can't find the watermark image, or that the syntax is incorrect:


```ruby
mogrify: Non-conforming drawing primitive definition image'.
```
    

