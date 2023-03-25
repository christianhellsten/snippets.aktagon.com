---
id: '935'
title: Python's etree and namespaces
languages:
- python
tags:
---
How to parse XML with Python's etree when XML has namespaces, also works with a default namespace:

```python
from lxml import etree
doc = etree.XML(bytes(bytearray(xml, encoding='utf-8')))
ns = {}
for k in doc.nsmap.keys():
   ns[k] = doc.nsmap[k]
doc.find('.//tag', ns)
doc.findtext('./periodOfReport', namespaces=ns)
```

LOL, someone needs to clean up the API.
