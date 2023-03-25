---
id: '947'
title: Answering what has happened before and after with WINDOW functions and PostgreSQL
languages:
- sql
tags:
---
This query answers what has happened and if something has happened before and after the current row in the group defined by the window function:

```sql
WITH log AS (
  SELECT
    array_agg(event_type) OVER (w ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE CURRENT ROW) AS what_happened_before,
    array_agg(event_type) OVER (w ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING EXCLUDE CURRENT ROW) AS what_happened_after,
    bool_or(event_type='error') OVER (w ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE CURRENT ROW) AS has_happened_before,
    bool_or(event_type='error') OVER (w ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING EXCLUDE CURRENT ROW) AS has_happened_after,
    *
  FROM events
  WINDOW w AS (PARTITION BY month ORDER BY month, id DESC)
  ORDER BY month, id DESC
)
SELECT * FROM log;
```

This query answers the following questions:

- What has happened in this group before/after the current row?
- Has a specific event happened in this group before/after the current row?

See documentation for details:
https://www.postgresql.org/docs/12/sql-expressions.html#SYNTAX-WINDOW-FUNCTIONS
