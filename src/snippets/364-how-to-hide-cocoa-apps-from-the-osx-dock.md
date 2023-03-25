---
id: '364'
title: How to hide Cocoa apps from the OSX dock
languages:
- objectivec
tags:
- aliases
- k8s
- kubectl
---
Open Info.plist and add the following:


```objectivec
NSUIElement=1
```
    

