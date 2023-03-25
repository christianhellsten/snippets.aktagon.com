---
id: '897'
title: Escaping strings in PostgreSQL queries
languages:
- sql
tags:
---
PostgreSQL queries containing, for example, single quotes or semicolons need to be escaped.

This won't work:

```sql
UPDATE jobs SET work=':'';
```

To make it work, escape the strings using C-style escapes (E'') and replacing single-quotes with '':

```sql
UPDATE jobs SET work=E':''';
```

See section "4.1.2.2. String Constants with C-style Escapes" in the PostgreSQL documentation https://www.postgresql.org/docs/10/sql-syntax-lexical.html for details.

