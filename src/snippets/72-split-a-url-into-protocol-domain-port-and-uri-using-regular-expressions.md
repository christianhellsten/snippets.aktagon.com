---
id: '72'
title: Split a URL into protocol, domain, port and URI using regular expressions
languages:
- java
tags:
---

```java
// Split URL into protocol, domain, port and URI
Pattern pattern = Pattern.compile("(https?://)([^:^/]*)(:\\d*)?(.*)?");
Matcher matcher = pattern.matcher(url);

matcher.find();

String protocol = matcher.group(1);            
String domain   = matcher.group(2);
String port     = matcher.group(3);
String uri      = matcher.group(4);
```
    

