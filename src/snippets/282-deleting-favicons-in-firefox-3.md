---
id: '282'
title: Deleting favicons in Firefox 3
languages:
- bash
tags:
---
To force Firefox to show your updated favicon (updating favicon.ico is not enough), first quit Firefox. Then issue the following commands in the terminal:


```bash
$ cd /Volumes/Macintosh\ HD/Users/christian/Library/Application\ Support/Firefox/Profiles/46xov8kt.default
$ sqlite3 places.sqlite 
SQLite version 3.5.0
Enter ".help" for instructions
sqlite> 
sqlite> delete from moz_favicons;
sqlite> update moz_places set favicon_id = NULL;
sqlite> .quit
```
    

