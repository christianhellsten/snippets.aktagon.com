---
id: '663'
title: How to print MacVim's startup time and version
languages:
- bash
tags:
---
I'm switching from [Janus to Vundle](http://c7.se/switching-to-vundle/), and I found this command useful in the migration process:


```bash
/usr/local/Cellar/macvim/7.3-66/MacVim.app/Contents/MacOS/Vim -v --startuptime /dev/stdout +qall
```
    

