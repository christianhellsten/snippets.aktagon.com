---
id: '348'
title: How to put the run loop to sleep
languages:
- objectivec
tags:
- postgres
- '"slowly changing"'
- temporal
---

```objectivec
NSDate *stopDate = [NSDate dateWithTimeIntervalSinceNow:2];
[[NSRunLoop currentRunLoop] runUntilDate:stopDate];
```
    

