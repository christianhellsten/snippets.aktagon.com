---
id: '619'
title: How to generate n-grams with Python and NLTK
languages:
- python
tags:
- color
- diff
- git
---

```python
import nltk
from nltk.util import ngrams

def word_grams(words, min=1, max=4):
    s = []
    for n in range(min, max):
        for ngram in ngrams(words, n):
            s.append(' '.join(str(i) for i in ngram))
    return s

print word_grams('one two three four'.split(' '))
```
    

