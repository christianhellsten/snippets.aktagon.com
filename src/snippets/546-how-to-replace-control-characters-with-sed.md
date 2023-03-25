---
id: '546'
title: How to replace control characters with Sed
languages:
- bash
tags:
- jaccard
- lsh
- minhash
- probabilistic
- randomness
- similarity
---
Replace control character ^A with tab character:


```bash
sed -e "s/$(echo -e \\001)/\\echo -e '\t'/g" file.txt
```
    

See [Wikipedia](http://en.wikipedia.org/wiki/ASCII#ASCII_control_characters) for list of control characters.

