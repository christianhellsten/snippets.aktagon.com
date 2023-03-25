---
id: '669'
title: How to open and repackage OSX .pkg files
languages:
tags:
---
[How to open and repackage OSX .pkg files](http://blog.coolaj86.com/articles/how-to-unpackage-and-repackage-pkg-osx.html)


```
pkgutil --expand /Volumes/xxx.pkg ~/Desktop/xxx.unpkg
...edit file(s)...
pkgutil --flatten ~/Desktop/xxx.unpkg ~/Desktop/xxx.pkg
```
    

