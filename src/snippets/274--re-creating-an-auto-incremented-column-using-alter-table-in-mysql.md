---
id: '274'
title: "(Re)Creating an auto incremented column using alter table in MySQL"
languages:
- sql
tags:
- local
- remote
- rsync
---
The column must become a key column.


```sql
alter table my_table add id int primary key auto_increment;
```
    

