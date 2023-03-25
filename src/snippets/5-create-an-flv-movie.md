---
id: '5'
title: Create an flv movie
languages:
- bash
tags:
- fontawesome
- phonegap
---
Create an flv movie that is 320 wide by 240 high. For audio functionality ffmpeg needs to be compiled with the following parameters:


```bash
--enable-amr_nb 
--enable-amr_nb-fixed 
--enable-amr_wb 
--enable-mp3lame
```
    

The snippet itself:


```bash
ffmpeg -i mymovie.avi -s 320x240 -ar 44100 -r 12 mymovie.flv
```
    

