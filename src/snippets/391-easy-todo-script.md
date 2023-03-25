---
id: '391'
title: Easy todo script
languages:
- bash
tags:
---
Create this into your path, edit the paths in the script, make it executable and start using it. Props to Niklas for sharing this idea!

I created the file as <sub>/bin/note\\ and\\ created\\ symlinks\\ from\\ it\\ to</sub>/bin/contact, <sub>/bin/password\\ and</sub>/bin/todo.


```bash
#!/bin/bash
note=$(basename $0)
tmp_file=/tmp/$(date +%d%m%Y-%T-%N)
note_file=/work/real_work/$note
gvim -f $tmp_file
echo "=== $(date +%d%m%Y-%T) ===" >> $note_file
cat $tmp_file >> $note_file
rm $tmp_file
```
    

