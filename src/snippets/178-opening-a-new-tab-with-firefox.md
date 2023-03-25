---
id: '178'
title: Opening a new tab with Firefox
languages:
- javascript
tags:
- debug
- go
- info
- '"line numbers"'
- log
- logging
- wrapper
---
Note that this only works from a Firefox extension:


```javascript
function openTab(url, focus) 
  {
    var tab = getBrowser().addTab(url);

    if(focus)
    {
      getBrowser().selectedTab = tab;
    }
   
    return tab;
  }
```
    

