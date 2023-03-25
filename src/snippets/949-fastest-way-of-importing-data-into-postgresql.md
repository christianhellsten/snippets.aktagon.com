---
id: '949'
title: Fastest way of importing data into PostgreSQL
languages:
- bash
tags:
---
The fastest way of importing data into PostgreSQL is to avoid any additional processing, i.e., use PostgreSQL tools instead of writing scripts in Python or other languages.

This will import the file directly from a file into PostgreSQL:

```bash
unzip -p data.csv.gz | PGOPTIONS=-—client-min-messages=warning psql —-no-psqlrc —-set ON_ERROR_STOP=on <db name> —-command="COPY table from STDIN"
```

You can also add preprocessing easily, such as removal of data with AWK, by piping commands together into a workflow.
