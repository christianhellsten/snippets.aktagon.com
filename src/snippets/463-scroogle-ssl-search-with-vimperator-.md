---
id: '463'
title: Scroogle SSL search with vimperator.
languages:
- bash
tags:
- postgres
- rails
- unlogged
---
A hack for using scroogle's SSL search as default search engine for :o, :p and :t commands of Vimperator.


```bash
:bmark https://ssl.scroogle.org/cgi-bin/nbbwssl.cgi?Gw=%s -title="Scroogle SSL search" -keyword=scroogle
:set defsearch=scroogle
```
    

