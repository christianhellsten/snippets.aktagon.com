---
id: '230'
title: ImageMagick and OpenEXR
languages:
- bash
tags:
- go
- xml
- xpath
---
I could not get OpenEXR delegate to work in ImageMagick. There was no reason for it in config.log. It just silently refused to get configured. I debugged the configure script and found out that PKG\_CONFIG was unset. So this fixed it. The --enable-hdri should be optional.


```bash
./configure PKG_CONFIG=/usr/bin/pkg-config --prefix=/usr/local/stow/imagemagick --enable-hdri
```
    

