---
id: '27'
title: Find the amount of CPU time and total time runtime for Oracle SQL queries
languages:
- sql
tags:
---
There's no equivalent to the MySQL slow query log in Oracle but these queries and the statspack reports are helpful when trying to find slow queries:


```sql
-- Order queries by how many cpu seconds they consume
SELECT   hash_value, executions, ROUND (elapsed_time / 1000000, 2) total_time,
         ROUND (cpu_time / 1000000, 2) cpu_seconds
    FROM (SELECT   *
              FROM v$sql
          ORDER BY elapsed_time DESC)
ORDER BY cpu_seconds DESC;

-- Find the total cpu seconds consumed
SELECT SUM (cpu_seconds)
  FROM (SELECT   hash_value, executions,
                 ROUND (elapsed_time / 1000000, 2) total_time,
                 ROUND (cpu_time / 1000000, 2) cpu_seconds
            FROM (SELECT   *
                      FROM v$sql
                  ORDER BY elapsed_time DESC)
        ORDER BY cpu_seconds DESC);


-- Find the total time queries have taken
SELECT SUM (total_time)
  FROM (SELECT   hash_value, executions,
                 ROUND (elapsed_time / 1000000, 2) total_time,
                 ROUND (cpu_time / 1000000, 2) cpu_seconds
            FROM (SELECT   *
                      FROM v$sql
                  ORDER BY elapsed_time DESC)
        ORDER BY cpu_seconds DESC);

-- Find execution plan for the damned query you should fix
SELECT *
  FROM v$sql_plan
 WHERE hash_value = 2967942512;
```
    

