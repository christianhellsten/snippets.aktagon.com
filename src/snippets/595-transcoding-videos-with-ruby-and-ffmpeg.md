---
id: '595'
title: Transcoding videos with Ruby and ffmpeg
languages:
- ruby
tags:
- advisory
- flock
- lock
---
[Transcoding videos with Ruby and ffmpeg](https://github.com/streamio/streamio-ffmpeg):


```ruby
require 'streamio-ffmpeg'
movie = FFMPEG::Movie.new("jebus.wmv")
movie.transcode("jebus.mp4") { |progress| puts progress }
movie.transcode("jebus.flv") { |progress| puts progress }
```
    

