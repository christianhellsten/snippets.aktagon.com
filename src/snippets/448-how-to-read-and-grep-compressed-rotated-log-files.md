---
id: '448'
title: How to read and grep compressed & rotated log files
languages:
- bash
tags:
- autocomplete
- bootstrap
- javascript
- jquery
- typeahead
---
Your typical server log directory looks something like this:


```bash
access.log
access.log.1
access.log.1.gz
access.log.2.gz
```
    

Now what if you want to extract data from day x to day y? You could use gzip and grep to uncompress the files, but there's a better way: the z commands.

All you have to do is:


```bash
zgrep "2010" /var/log/apache2/access.log*
```
    

More info on the subject can be found here: <http://www.thegeekstuff.com/2009/05/zcat-zless-zgrep-zdiff-zcmp-zmore-gzip-file-operations-on-the-compressed-files/>

