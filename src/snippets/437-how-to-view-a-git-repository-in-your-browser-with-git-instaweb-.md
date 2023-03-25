---
id: '437'
title: 'How to view a Git repository in your browser with "git instaweb" '
languages:
- bash
tags:
- csv
- html
- json
- table
---
**git instaweb -d webrick**:


```bash
% git instaweb -d webrick      
[2010-02-18 17:27:01] INFO  WEBrick 1.3.1
[2010-02-18 17:27:01] INFO  ruby 1.8.7 (2008-08-11) [i686-darwin10.0.0]
No known browser available.
http://127.0.0.1:1234
```
    

Now open http://127.0.0.1:1234 in your browser.

You can also add this this to ./gitconfig:


```bash
[instaweb]
httpd=webrick
```
    

