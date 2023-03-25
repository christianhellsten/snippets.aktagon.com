---
id: '171'
title: Installing ImageMagick, mini-magick and rmagick on Mac OS X Leopard
languages:
- ruby
tags:
---
I had no success installing ImageMagick and mini-magick with the instructions I found on [this page](http://www.aldenta.com/2007/11/26/installing-imagemagickrmagick-on-leopard/) but after some googling I found [this blog post](http://nullstyle.com/2007/10/27/how-to-build-imagemagick-and-install-rmagick-with-macports-on-mac-os-x-leopard/), which had the magic commands that worked for me:


```ruby
sudo port install tiff -macosx  #disables the linkage with Apple's open gl
sudo port install ImageMagick

sudo gem install rmagick
sudo gem install mini_magick
```
    

To test mini-magick, open an irb console and paste in the following code:


```ruby
require 'rubygems'
require 'mini_magick'

path = "public/images/0000/0003/logo.jpg"
image = MiniMagick::Image.new(path)

#print width and height
puts image[:width]
puts image[:height]
```
    

