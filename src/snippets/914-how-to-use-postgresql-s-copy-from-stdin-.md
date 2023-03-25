---
id: '914'
title: How to use PostgreSQL's "COPY FROM STDIN"
languages:
- bash
tags:
---
This is an example of how to use PostgreSQL's "COPY FROM STDIN":

```bash
psql xxx_development -c "COPY table1(column1, column2) FROM STDIN DELIMITER E'\t' QUOTE E'\x01' ENCODING 'ISO-8859-1' CSV HEADER;" < sub.txt
```

NOTE: The following example where I put the "COPY FROM STDIN" in a file does not work:

```bash
# The COPY FROM STDIN SQL statement is in a file named copy.sql. This does not work:
psql xxx_development | cat copy.sql
```bash
