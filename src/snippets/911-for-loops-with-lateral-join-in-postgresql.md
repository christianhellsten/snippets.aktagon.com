---
id: '911'
title: For loops with LATERAL JOIN in PostgreSQL
languages:
- sql
tags:
---
```sql
SELECT
  *
-- initial data that we want to loop through
FROM (
  SELECT
    *
  FROM
    financials
  WHERE
    quarter = '2020-06-30'
-- for each row run this query
) current_quarter LEFT JOIN LATERAL (
  SELECT
    revenue AS previous_revenue
  FROM
    financials
  WHERE
    company_id = current_quarter.company_id AND 
    -- calculate previous_quarter by subtracting one day
    quarter = to_char(date_trunc('quarter', current_quarter.quarter)::date - 1, 'yyyy-mm-dd')::date
) previous_quarter ON true;
```
