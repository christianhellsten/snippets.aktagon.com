---
id: '124'
title: How to export and import Oracle schemas, or backup Oracle databases
languages:
- bash
tags:
- ecto
- elixir
- tagging
- tags
---
You can use the exp and imp executables to perform data backup and restoration.


```bash
-- Export
exp <username>/<password>@<server> file=data.dmp consistent=y grants=no statistics=none

-- Import
imp <username>/<password>@<server> file=data.dmp fromuser=<source_username> touser=<username>
```
    

