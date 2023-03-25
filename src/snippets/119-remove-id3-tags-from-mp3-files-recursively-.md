---
id: '119'
title: Remove ID3 tags from MP3 files recursively.
languages:
- bash
tags:
---
Remove id3 tags from MP3 files recursively.


```bash
#!/bin/bash
# By Marko Haapala
# requirements:
# id3ed - apt-get install id3ed
IFS=$'\n'
for mp3_file in $(find ./ -type f -iname '*.mp3'); do
	id3ed -r "${mp3_file}"
done
```
    

