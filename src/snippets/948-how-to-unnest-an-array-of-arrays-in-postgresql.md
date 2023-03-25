---
id: '948'
title: How to unnest an array of arrays in PostgreSQL
languages:
- sql
tags:
---
If you try to use unnest with array_agg you will get the following error:

```sql
SELECT array_agg(unnest(ids)) FROM (
  SELECT
    month, array_agg(id) as ids
  FROM x
  GROUP BY month
);
ERROR:  0A000: aggregate function calls cannot contain set-returning function calls
LINE 14:   array_agg(unnest(ids)) AS ids,
                     ^
HINT:  You might be able to move the set-returning function into a LATERAL FROM item.
```

You can use jsonb_agg and jsonb_array_elements_text to flatten or unnest an array of arrays in PostgreSQL:

```sql
SELECT
  jsonb_array_elements_text(jsonb_agg(array_of_arrays))
FROM
  x;
```

But multiple rows will be returned.

For other solutions, see:

https://stackoverflow.com/a/8142998

https://wiki.postgresql.org/wiki/Unnest_multidimensional_array
