---
id: '428'
title: How to parse XML with Python's built-in ElementTree parser
languages:
- python
tags:
---

```python
from xml.etree.ElementTree import fromstring, tostring

namespace = 'https://xxx.com/xxx'
element = fromstring(xml)

device = element.find('.//{%s}Device' % namespace)
detail = device.find('.//{%s}Details' % namespace)
series = device.findall('.//{%s}Series' % namespace)
```
    

Watch out for namespaces...

