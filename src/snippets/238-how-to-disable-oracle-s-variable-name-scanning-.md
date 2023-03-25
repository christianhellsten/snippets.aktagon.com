---
id: '238'
title: 'How to disable Oracle''s variable name scanning '
languages:
- sql
tags:
- count
- ecto
- group_by
- left_join
- order_by
---
Normally Oracle will scan SQL for variables and prompt for the value at runtime, to disable this feature use the "set scan off" command:


```sql
set scan off;

select * from links where href = 'http://...&....';
```
    

