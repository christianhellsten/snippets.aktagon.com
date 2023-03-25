---
id: '409'
title: How to use MySQL's ON DUPLICATE to track page views
languages:
- sql
tags:
---
With MySQL 5 you can track page views with ON DUPLICATE.

The table:


```sql
create table page_views(
  uri varchar(500) not null,
  views int(11) not null default '0',
  primary key(uri)
)
```
    

The SQL:


```sql
insert into page_views (uri, views) values ('/products', 1) on duplicate key update views = views + 1;
```
    

See <http://dev.mysql.com/doc/refman/5.0/en/insert-on-duplicate.html> for more information.

