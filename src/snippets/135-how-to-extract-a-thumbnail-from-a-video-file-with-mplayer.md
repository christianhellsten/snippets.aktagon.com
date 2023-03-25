---
id: '135'
title: How to extract a thumbnail from a video file with mplayer
languages:
- ruby
tags:
---

```ruby
mplayer 123.avi -ss 1 -nosound -vo jpeg:outdir=. -frames 2
```
    

We use the **-ss** switch to jump to the first second of the video; specify the time in either seconds or hh:mm:ss. We tell mplayer that we want two frames with the **-frames** switch.

Make sure jpeg is in the list of supported video output formats:


```ruby
mplayer -vo help
```
    

