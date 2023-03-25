---
id: '629'
title: Spotify not starting on OSX?
languages:
- bash
tags:
- docker
- host
- podman
---
Spotify not starting or crashing on OSX? Try deleting the Spotify cache:


```bash
rm -rf ~/Library/Caches/com.spotify.Client
```
    

Worked for me…

