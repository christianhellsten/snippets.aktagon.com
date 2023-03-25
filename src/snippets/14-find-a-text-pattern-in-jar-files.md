---
id: '14'
title: Find a text pattern in jar files
languages:
- bash
tags:
---
Helpful when you need to find a class or package in some jar file recursively below the current directory. Still needs a test to see if the file found was a file or directory. Works case insensitively. Uses the unzip command because of it's performance superiority in comparison to jar.


```bash
#!/bin/sh
for f in find . -type f -name '*\.jar'
do
        unzip -l $f | grep -i $1 && echo "was found in $f"
done
```
    

