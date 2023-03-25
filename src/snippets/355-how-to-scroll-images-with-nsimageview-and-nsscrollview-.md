---
id: '355'
title: 'How to scroll images with NSImageView and NSScrollView '
languages:
- objectivec
tags:
---
1.  In IB (Interface Builder) add an NSImageView to the window.
2.  Select the NSImageView.
3.  From the menu select Select Layout ~~&gt; Embed Objects In~~&gt; Scroll View.
4.  Select the NSScrollView press Cmd+3 and configure the NSScrollView to expand and fill all available space.
5.  Remove the NSImageView's border
6.  Use this code to resize the NSImageView's frame to match the size of the NSImage


```objectivec
NSImageView *imageView = ...;
[imageView setFrameSize:viewSize];

NSLog(@"imageView's frame after resizing: %@", NSStringFromRect([imageView frame]));
```
    

