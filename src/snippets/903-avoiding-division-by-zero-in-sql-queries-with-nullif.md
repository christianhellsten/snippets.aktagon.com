---
id: '903'
title: Avoiding "division by zero" in SQL queries with NULLIF
languages:
- sql
tags:
---
Use NULLIF to avoid "division by zero" in SQL queries when the divisor can have the value zero.

Example:

```sql
SELECT
  col_x / NULLIF(col_y, 0) as change,
...
```

The result will be NULL when col_y contains the value zero.
