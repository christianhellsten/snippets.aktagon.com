---
id: '775'
title: Postgres Performance Tuning
languages:
- sql
tags:
---
## Tuning memory

To tune memory it helps to understand how much data fits into memory:

```sql
SELECT 
  sum(heap_blks_read) as heap_read,
  sum(heap_blks_hit)  as heap_hit,
  sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) as ratio
FROM 
  pg_statio_user_tables;
```

If the cache hit rate is below 99%, try giving PG more memory.

## Finding slow queries

Using the slow-query feature is one option. Telling Postgres to store statistics is easier:

```sql
CREATE extension pg_stat_statements;

-- View slowest queries
SELECT 
  (total_time / 1000 / 60) as total_minutes, 
  (total_time/calls) as average_time, 
  query 
FROM pg_stat_statements 
ORDER BY 1 DESC 
LIMIT 100;
```

## Finding tables that are not indexed

```sql
SELECT 
  relname, 
  100 * idx_scan / (seq_scan + idx_scan) percent_of_times_index_used, 
  n_live_tup rows_in_table
FROM 
  pg_stat_user_tables
WHERE 
    seq_scan + idx_scan > 0 
ORDER BY 
  n_live_tup DESC;
```

Reference:
- http://www.craigkerstiens.com/2012/10/01/understanding-postgres-performance/
- http://www.craigkerstiens.com/2013/01/10/more-on-postgres-performance/
