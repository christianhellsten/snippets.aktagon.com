---
id: '744'
title: Diffs with Postgres' lead and window functions
languages:
- sql
tags:
---
Our requirement
---------------

Output the previous quarter's value for each company:


```sql
ID | NAME              | QUARTER     |  VALUE    | PREVIOUS_VALUE
1  | CORP              | 2015-03-31  |  44317.00 | 38755.00
1  | CORP              | 2014-12-31  |  38755.00 | 33617.00
1  | CORP              | 2014-09-30  |  33617.00 | 32406.00
1  | CORP              | 2014-06-30  |  32406.00 | 29909.00
1  | CORP              | 2014-03-31  |  29909.00 | 0
```
    

The solution
------------

To calculate the change we use the window and lead functions:


```sql
WITH diffs AS (
  select
    *,
    coalesce(lead(value) over (partition by company_id order by quarter desc), 0) as previous_value
  from
    history
)
select * from diffs;
```
    

Note that the window is partitioned by company\_id, and ordered by quarter.

