---
id: '209'
title: Creating a MySQL user with just enough privileges
languages:
- sql
tags:
- bash
- git
- version
- zsh
---

```sql
GRANT DELETE,INSERT,SELECT,UPDATE ON charlie_production.* TO 'munger'@'localhost' IDENTIFIED BY 'xxx';
```
    

