---
id: '267'
title: Appending strings in bash without the line feed.
languages:
- bash
tags:
- crosstab
- pivot
- postgresql
- year
---
To append to a stream in bash without the trailing line feed use printf to format the output before appending it to the stream.


```bash
i=42
FILE=/tmp/atm
printf "%s" "${i}" > $FILE
```
    

