---
id: '58'
title: Resume scp download
languages:
- bash
tags:
- rest-client
- ruby
---
Unfortunately there is no way for scp to resume a download. Don't despair though if your download was interrupted. Rsync is capable of resuming it. Be aware though, that rsync makes a temporary file that will become as large as the target file is so your disk may become full during the resume process.


```bash
rsync --partial --progress --rsh=ssh host:/work/source.tar.bz2 .
```
    

