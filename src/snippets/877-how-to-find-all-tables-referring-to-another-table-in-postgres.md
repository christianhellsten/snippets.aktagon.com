---
id: '877'
title: How to find all tables referring to another table in Postgres
languages:
- sql
tags:
---
This example lists all tables that contain a column named 'organization_id':

```sql
SELECT c.relname AS table,
       a.attname AS column,
       n.nspname AS schema
FROM   pg_class AS c
       INNER JOIN pg_attribute AS a
               ON a.attrelid = c.oid
       JOIN pg_namespace n
         ON n.oid = c.relnamespace
WHERE  a.attname = 'organization_id'
       AND c.relkind = 'r'
       AND c.relname NOT LIKE 'pg_%'
ORDER  BY c.relname,
          a.attname  
```
