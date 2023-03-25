---
id: '214'
title: 'Work around for "bash: /bin/rm: Argument list too long"'
languages:
- bash
tags:
- crystal
- to_json
---
Use find instead of rm:


```bash
find . -name '*' | xargs rm
```
    

The command deletes all files in the current directory.

