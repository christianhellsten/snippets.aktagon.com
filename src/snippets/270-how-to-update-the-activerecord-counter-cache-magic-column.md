---
id: '270'
title: How to update the ActiveRecord counter_cache magic column
languages:
- sql
tags:
- hl7
- ruby
---
You can use the model.update\_counters method to update the counter\_cache column. But if you have a million rows it be very fast.

So for large tables it's best to do it with a query such as this:


```sql
update categories, (select 
                      id as category_id, ifnull(count, 0) as count
                    from categories left join 
                      (select category_id, count(id) as count from products group by category_id) as count_table 
                    on 
                      categories.id = count_table.category_id) as count_table
set 
  categories.products_count = count_table.count
where
  categories.id = count_table.category_id
```
    

This query updates the count for all rows.

The code needs to be modified for your database design.

