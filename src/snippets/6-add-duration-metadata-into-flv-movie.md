---
id: '6'
title: Add duration metadata into flv movie
languages:
- bash
tags:
- javascript
- promises
---
By default an flv movie doesn't contain the duration metadata. Using the flvtool2 program it is injected like this into the movie file.


```bash
cat mymovie.flv | flvtool2 -U stdin mymovie.flv
```
    

