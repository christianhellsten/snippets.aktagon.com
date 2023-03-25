---
id: '7'
title: Create a thumbnail of a movie.
languages:
- bash
tags:
- rails
- ruby
---
Create a thumbnail that is 320 wide by 240 high and five seconds into the movie.


```bash
ffmpeg -i mymovie.avi -f mjpeg -t 0.001 -ss 5 -s "320x240" mymovie.jpg
```
    

