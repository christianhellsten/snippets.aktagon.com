---
id: '213'
title: Bulk resizing images with Imagemagick.
languages:
- bash
tags:
- erb
- ruby
---
Quick and dirty, but handy one-liner that resizes all \*.jpg files in the current directory.


```bash
for image in *.jpg; do convert $image -resize 800x600 800x600-$image; done
```
    

