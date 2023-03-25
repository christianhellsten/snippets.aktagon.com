---
id: '357'
title: Showing and hiding an NSWindow programatically
languages:
- objectivec
tags:
- go
- ssh
---

```objectivec
// Show
[myWindow makeKeyAndOrderFront:self];
[NSApp activateIgnoringOtherApps:YES];
// Hide
[myWindow orderOut:self];
```
    

