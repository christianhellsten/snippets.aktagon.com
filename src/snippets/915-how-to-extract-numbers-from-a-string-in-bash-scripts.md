---
id: '915'
title: How to extract numbers from a string in Bash scripts
languages:
- bash
tags:
---
To extract numbers from a string in Bash scripts you can use a bash feature called [REMATCH](http://molk.ch/tips/gnu/bash/rematch.html). You don't need grep, sed, or awk.

Add this to script.sh (remember to run *chmod +x script.sh*):

```bash
#!/usr/bin/env bash
string="COPY 23845\n3409"
if [[ $string =~ ^COPY[[:space:]]([0-9]+) ]]; then
  echo "Match: ${BASH_REMATCH[1]}"
else
  echo "No match"
fi
```

This will print 23845, but not 3409. Note that this example uses a capture group.
