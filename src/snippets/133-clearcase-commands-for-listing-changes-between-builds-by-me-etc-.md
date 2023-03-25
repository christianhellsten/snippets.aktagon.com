---
id: '133'
title: ClearCase commands for listing changes (between builds, by me, etc)
languages:
- bash
tags:
- database
- performance
- postgres
- tuning
---

```bash
# List changes done by me
cleartool lshistory -since 10-January-2007 -recurse -me

# List view only files
cleartool ls -view_only -recurse

# Find changes between two releases
cleartool find PATH -print -version "lbtype(NEW_BUILD_LABEL) && !version(OLD_BUILD_LABEL)"
```
    

