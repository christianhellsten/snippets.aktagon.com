---
id: '32'
title: Paginating a list in Java
languages:
- java
tags:
---
Not fully tested, but the idea works.


```java
List list = ....;                           // Example: page size is 5
int originalSize = list.size();             // original size: 24
int start = Math.min(list.size(), Math.abs(currentPage * pageSize));      // start: 5
list.subList(0, start).clear();             // list now contains: 5, 6, 7, 8, 9,..., 23

int size = list.size();                     // size is now: min(listSize, originalSize - pageSize) = 19
int end = Math.min(pageSize, size);         // end: 5
list.subList(end, size).clear();            // list now contains: 5, 6, 7, 8, 9

boolean hasNext = (end < size);             // has next: 5 < 19
boolean hasPrevious =  (start > 0);         // has previous: 5 > 0
```
    

