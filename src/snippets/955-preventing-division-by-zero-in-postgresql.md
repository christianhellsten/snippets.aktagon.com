---
id: '955'
title: Preventing division by zero in PostgreSQL
languages:
- sql
tags:
---
```sql
localhost=# select 1 / 0;
ERROR:  22012: division by zero
LOCATION:  int4div, int.c:824
```

Hmmm:

```sql
localhost=# select 1 / NULL;
┌──────────┐
│ ?column? │
├──────────┤
│        ¤ │
└──────────┘
(1 row)

Time: 7.067 ms
```

Ergo:

```sql
localhost=# select 1 / NULLIF(0, 0);
┌──────────┐
│ ?column? │
├──────────┤
│        ¤ │
└──────────┘
(1 row)

Time: 0.303 ms
```
