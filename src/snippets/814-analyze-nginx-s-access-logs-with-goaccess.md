---
id: '814'
title: Analyze Nginx's access logs with goaccess
languages:
- bash
tags:
---
## Show all statistics

```bash
sudo zcat /var/log/nginx/*.access.log.* | goaccess --log-format=COMBINED
```

## Show server errors

```bash
sudo zcat /var/log/nginx/*.access.log.* | awk '$9~/500/' | goaccess --log-format=COMBINED
```
