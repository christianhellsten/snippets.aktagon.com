---
id: '544'
title: How to remove text between a tag from XML or HTML with SED
languages:
- bash
tags:
---
This will remove the users tag and everything in between the users tag:


```bash
sed -i .bak '/<users type="array">/,/<\/users>/d' users.xml
```
    

A backup will be created named users.xml.bak.

If you want to select only specific tags use this:


```bash
sed -n -e '/<private-parts>/,/<\/private-parts>/p' e users.xml
```
    

For more advanced XML processing use:
\* [XMLStarlet](http://www.ibm.com/developerworks/library/x-starlet/index.html)
\* [xml-coreutiles](https://github.com/rudimeier/xml-coreutils)
\* [xml2/2xml](http://www.ofb.net/~egnor/xml2/examples)
\* Your imagination.

