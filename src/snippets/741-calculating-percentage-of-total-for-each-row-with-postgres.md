---
id: '741'
title: Calculating "percentage of total" for each row with Postgres
languages:
- sql
tags:
---
Calculating the "percentage of the total" for each row with Postgres can be done with a window function:


```sql
SELECT
  *,  (value / SUM(value) OVER ()) AS "% of total"
FROM
  transactions
WHERE
  quarter = '2015-03-31' and company_id = 1;
```
    
We're using "OVER ()", which means the sum over all rows returned by the where clause.

