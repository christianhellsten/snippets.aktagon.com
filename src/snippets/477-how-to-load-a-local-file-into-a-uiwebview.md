---
id: '477'
title: How to load a local file into a UIWebView
languages:
- objectivec
tags:
- '"advisory lock"'
- pg_try_advisory_lock
- python
- sqlalchemy
---
First you'll need to setup a UIWebView in for example Interface Builder. Then in the controller you add this incredible piece of code:


```objectivec
NSString *path = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"html" inDirectory:@"html"];
NSLog(@"%@", path);
NSURL *url = [NSURL fileURLWithPath:path];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
[webView loadRequest:request];
```
    

This beautiful piece of code will look for a file named about.html in a folder called html. Now go create that folder and the file with your favorite tools.

Next drag that folder under your application in Groups & Files in XCode. Now to make XCode happy you have to make sure you select Create Folder References for any added folders.

That's it. If you get this error it means the file couldn't be found, and that you didn't import the files correctly:


```objectivec
Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[NSURL initFileURLWithPath:]: nil string parameter'
```
    

