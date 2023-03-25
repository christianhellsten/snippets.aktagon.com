---
id: '435'
title: How to use a Python decorator wrapper to get a reference to the calling class
  instance
languages:
- python
tags:
---

```python
def requires_authentication(method):
    """
    self points to a SheisseController instance instead of the decorator function.
    """
    def wrapper(self, *args, **kwargs):
        if self._requires_authentication == True and self._authenticated == False:
            return response('403 Forbidden or whatever')

        return method(self, *args, **kwargs)
    return wrapper

class SheisseController:
  @requires_authentication
  def index(self):
```
    

