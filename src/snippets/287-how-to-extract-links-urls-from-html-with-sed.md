---
id: '287'
title: How to extract links/urls from HTML with Sed
languages:
- bash
tags:
- dtruss
- gdb
- ruby
- strace
---
First download <http://sed.sourceforge.net/grabbag/scripts/list_urls.sed>.

Make the script executable with chmod:


```bash
chmod +x list_urls.sed
```
    

Now pipe the HTML to the script:


```bash
cat your.html | list_urls.sed
```
    

The output will be all URLs it finds...

More [Sed scripts and documentation can be found here](http://sed.sourceforge.net/)

