---
id: '673'
title: How to export a Google Doc spreadsheet to CSV
languages:
tags:
---
It's no longer possible to export Google Spreadsheet's to CSV, so use JSON instead:


```
https://spreadsheets.google.com/feeds/list/<SPREADSHEET_KEY>/od6/public/values?alt=json
```
    

You can find the SPREADSHEET\_KEY in the Google Doc's original URL.

You can also use the [Google Drive API](http://www.nczonline.net/blog/2014/03/04/accessing-google-spreadsheets-from-node-js/).

