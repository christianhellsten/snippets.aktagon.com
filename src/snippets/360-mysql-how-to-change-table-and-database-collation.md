---
id: '360'
title: 'MySQL: How to change table and database collation'
languages:
- sql
tags:
- rails
- webpacker
---
Listing table information including collation
---------------------------------------------


```sql
show table status;
```
    

To show all table information use this command:


```sql
show full columns from xxx;
```
    

Convert existing columns in a table to a specific collation
-----------------------------------------------------------


```sql
alter table brands convert to character set utf8 collate utf8_swedish_ci;
```
    

This command converts all existing columns to the specified collation.

Change table collation
----------------------


```sql
alter table posts collate utf8_swedish_ci;
```
    

Note that this doesn't change collation of existing columns.

Setting the collation manually
------------------------------


```sql
set session collation_database=utf8_swedish_ci;
set session collation_connection=utf8_swedish_ci;
```
    

Common collation values
-----------------------


```sql
utf8_swedish_ci
utf8_general_ci
```
    

