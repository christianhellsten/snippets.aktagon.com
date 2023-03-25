---
id: '959'
title: 'MacOS: Migrate from Docker Desktop to podman'
languages:
- bash
tags:
---
```bash
$ brew install podman
$ podman machine init
$ podman machine start
$ alias docker=podman
```

Source:
https://news.ycombinator.com/item?id=28462495
