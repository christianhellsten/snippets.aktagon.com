---
id: '427'
title: How to use Python's simplejson to read and write JSON data
languages:
- python
tags:
---
First you need to install simplejson:


```python
easy_install simplejson
```
    

Now you can dump data to JSON:


```python
import simplejson as json

class Something:

    def __init__(self):
        self.test = "test"

    def to_json(self):
        return json.dumps(self.__dict__)
```
    

Or if you have complex objects:


```python
import simplejson as json
class Something:

    def __init__(self):
        self.test = [Other('a', 'b'), Other('a', 'c')]

    def to_json(self):
        return json.dumps([p.__dict__ for p in self.devices])
```
    

