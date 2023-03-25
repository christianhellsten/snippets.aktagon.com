---
id: '933'
title: Ruby's to_json in Python
languages:
- python
tags:
---
```python
from json import JSONEncoder

class MyEncoder(JSONEncoder):
    def default(self, o):
         if isinstance(obj, XY):
             return { 'x': obj.x, 'y': obj.y }
        return o.__dict__

def to_json2(value):
    return MyEncoder(indent=2).encode(value)
```
