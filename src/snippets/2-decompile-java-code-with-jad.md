---
id: '2'
title: Decompile Java code with JAD
languages:
- bash
tags:
---
How to decompile Java source code and include original line numbers with [JAD](http://www.kpdus.com/jad.html):


```bash
jad -pi -b -ff -space -lnc -s java -d output_directory -r directory_containing_class_files\**\*.class
```
    

