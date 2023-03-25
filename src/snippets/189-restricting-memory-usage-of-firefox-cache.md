---
id: '189'
title: Restricting memory usage of Firefox cache
languages:
- bash
tags:
- debounce
- mithril
---
[Firefox](www.mozilla.com/firefox/) hogs a lot of memory when using pages using [Ajax](http://en.wikipedia.org/wiki/AJAX) enabled web pages. I need to restart the browser many times during a day at the office. This hack seems to have fixed that issue.

Open the location <about:config>, right click and create a new key of integer type.

Key:


```bash
browser.cache.memory.capacity
```
    

Value:


```bash
16384
```
    

