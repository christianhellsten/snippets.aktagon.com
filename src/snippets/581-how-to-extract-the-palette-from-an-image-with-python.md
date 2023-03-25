---
id: '581'
title: How to extract the palette from an image with Python
languages:
- python
tags:
---
Detect the color palette of an image:


```python
# See https://github.com/99designs/colorific/blob/master/colorific.py
# min_saturation = The minimum saturation needed to keep a color
# min_prominence = The minimum proportion of pixels needed to keep a color
import colorific
palette = >>> colorific.extract_colors('test.jpg', min_prominence=0.1)
colorific.print_colors('test.jpg', palette)
```
    

Example
-------

This example will scan a directory for images and create an HTML file showing the images and the detected color palette for each image:


```python
import colorific
import glob

html = open("index.html", "w")

for filename in glob.glob('./images/*'):
    html.write("<div>")
    html.write("<img width=\"150px\" src=\"" + filename + "\">")
    print filename
    palette = colorific.extract_colors(filename)
    print palette
    for color in palette.colors:
        print color
        hex_value = colorific.rgb_to_hex(color.value)
        html.write("""
            <div style="background: {color}; width: 500px; height: 50px; color: white;">
            {prominence}
            </div>
        """.format(color=hex_value, prominence=color.prominence))
        html.write("</div>")

    if palette.bgcolor != None:
        hex_value = colorific.rgb_to_hex(palette.bgcolor.value)
        html.write("""
            <div style="background: {color}; width: 500px; height: 50px; color: white;">
            {prominence}
            </div>
        """.format(color=hex_value, prominence=palette.bgcolor.prominence))
        html.write("</div>")
```
    

Issues
------

Note, on OSX I had to edit colorific.py (/Library/Python/2.7/site-packages/colorific-0.2.0-py2.7.egg/colorific.py) slightly to get it to work:


```python
#from PIL import Image as Im
#from PIL import ImageChops, ImageDraw
import Image as Im
import ImageChops, ImageDraw
```
    

Before this, I got this error:


```python
ImportError: No module named PIL
```
    

