---
id: '740'
title: Selecting the "top n" or "n latest" rows by group in Postgres
languages:
- sql
tags:
- backup
- postgres
---
This SQL query selects the top 10 transactions for each user:

-   partition the transactions by user_id
-   order the transactions in each partition by the column created_at
-   select only first row, i.e. the latest

```sql
WITH latest_customer_transactions AS (
  SELECT
    *, row_number() OVER (PARTITION BY user_id ORDER BY created_at desc) AS rownum
  FROM
    transactions
)
SELECT
  id, user_id
FROM
  latest_user_transactions
WHERE
  rownum <= 10;
```

Note that if you simply want the first record per group it's probably best to use DISTINCT ON as described here:
https://www.periscopedata.com/blog/first-row-per-group-5x-faster

```sql
SELECT DISTINCT ON (user_id) *
FROM jobs
ORDER BY user_id,
         priority DESC,
         created_at
```

    
Note the differences between RANK, ROW_NUMBER, and DENSE_RANK:
http://blog.jooq.org/2014/08/12/the-difference-between-row_number-rank-and-dense_rank/

