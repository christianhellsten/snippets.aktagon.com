---
id: '728'
title: Splitting CSV files with the cut command
languages:
- bash
tags:
- bundler
- docker
- gemfile
---
This script which uses the cut command will split the lines on commas and print the 3rd column:


```bash
echo "1, 2, 3, 4\n5, 6, 7, 8" | cut -d "," -f 3
=> 3
=> 7
```
    

