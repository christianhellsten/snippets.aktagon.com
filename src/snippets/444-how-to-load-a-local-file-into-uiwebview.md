---
id: '444'
title: How to load a local file into UIWebView
languages:
- objectivec
tags:
---
First create index.html. Next add it to the Resources folder by right-clicking and selecting Add existing files from the menu.

Now you can display the file in a UIWebView with the following code:


```objectivec
[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];
```
    

Via <http://www.iphonedevsdk.com/forum/iphone-sdk-development/1784-how-can-i-access-local-html-file-using-uiwebview.html>

