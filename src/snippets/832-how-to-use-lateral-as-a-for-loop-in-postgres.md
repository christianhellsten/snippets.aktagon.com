---
id: '832'
title: How to use LATERAL as a for loop in Postgres
languages:
- sql
tags:
---
This example shows how to use LATERAL as a for loop in Postgres. The query will perform a lateral subquery for each month. The subquery returns the number of active courses during each month.

```sql
-- A list of months and their start and end timestamps
WITH months AS (
  SELECT start, start + (interval '1' month) - (interval '1' second) AS end FROM (
    SELECT generate_series(DATE('2010-01-01'), DATE('2010-12-01'), interval '1 month') AS start
  ) months
)
-- For each month, run a query that returns the number of active courses during that month
SELECT * FROM months AS m
LEFT JOIN LATERAL (
  SELECT count(id)
  FROM courses AS c
  WHERE
    (c.start <= m.end AND c.start >= m.start) OR
    (c.end <= m.end AND c.end IS NULL)
) AS results ON TRUE;
```
