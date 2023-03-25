---
id: '575'
title: How to get the running total for data grouped by month for a MySQL query
languages:
- sql
tags:
- after_create
- after_save
- association
- rails
---

```sql
SET @running_total:=0;
select 
	xx.*,
	(@running_total := @running_total + xx.total) AS running_total
from (
select count(id) total, concat(concat(year(created_at), '-', lpad(month(created_at), 2, '0'))) year_month
from users 
where created_at is not null group by year_month order by year_month
) as xx;
```
    

From <http://stackoverflow.com/questions/664700/calculate-a-running-total-in-mysql>

