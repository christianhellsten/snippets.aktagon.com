---
id: '26'
title: How to generate an Oracle statspack report and an explain plan for a query
languages:
- sql
tags:
---

```sql
-- Connect

sqlplus <username>/<password>@<database>

-- Generate statspack report

@?/rdbms/admin/spreport.sql

-- Find execution plan for a specific query
@?/rdbms/admin/sprepsql.sql

Specify the Begin and End Snapshot Ids
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Enter value for begin_snap: 1
Begin Snapshot Id specified: 1

Enter value for end_snap: 2
End   Snapshot Id specified: 2


Specify the Hash Value
~~~~~~~~~~~~~~~~~~~~~~
Enter value for hash_value: 2967942512
Hash Value specified is: 2967942512
```
    

