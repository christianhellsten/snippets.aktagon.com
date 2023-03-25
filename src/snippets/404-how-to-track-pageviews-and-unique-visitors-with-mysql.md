---
id: '404'
title: How to track pageviews and unique visitors with MySQL
languages:
- sql
tags:
---
Create a table:


```sql
create table page_views (id VARCHAR(50), views INTEGER) primary key id;
```
    

Use the ON DUPLICATE declaration:


```sql
insert into page_views (id, views) values ('/', 1) on duplicate key update views = views + 1;
```
    

Idea from <http://simonwillison.net/2009/Jun/30/analytics/>

