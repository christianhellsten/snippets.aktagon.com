---
id: '558'
title: How to remove a background with ImageMagick
languages:
- bash
tags:
---
How to remove a random and uniform background from an image:


```bash
convert me.jpg -fill none -fuzz 1% -draw 'matte 0,0 floodfill' -flop  -draw 'matte 0,0 floodfill' -flop me.png
```
    

This will fill pixels similar in color to the pixel at x=0 and y=0. We use a fuzz setting of 1% to make colors similar to the background transparent.

This method works best on uniform backgrounds and objects with clear boundaries that make it stand out from the background.

Reference:
http://www.imagemagick.org/Usage/morphology/\#intro

