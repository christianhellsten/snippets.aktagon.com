---
id: '932'
title: URL join for Python
languages:
- python
tags:
---
```python
def url_join(*parts):
    # This does not work with many parts:
    # import urllib.parse
    # urllib.parse.urljoin(*parts)
    return os.path.join(*parts)
```
