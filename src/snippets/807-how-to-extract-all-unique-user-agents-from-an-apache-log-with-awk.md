---
id: '807'
title: How to extract all unique user agents from an Apache log with awk
languages:
- bash
tags:
---
```bash
sudo awk -F\" '($2 ~ "^GET /"){print $6}' /var/log/apache2/access.log|sort|uniq > ua.log
```
