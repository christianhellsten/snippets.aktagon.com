---
id: '752'
title: How to create random data with Postgres
languages:
- sql
tags:
---
This example creates random data from a predefined list of valid values:


```sql
insert into transactions(description, price, timestamp) values(
  ('{Bought cat,Bought dog,Bought house}'::text[])[ceil(random()*3)],
  ('{10,20}'::int[])[ceil(random()*2)],
  NOW() - '1 day'::INTERVAL * ROUND(RANDOM() * 100)
)
```

This sets a column to a random UUID:

```sql
UPDATE customers SET name = uuid_in(md5(random()::text || clock_timestamp()::text)::cstring);
```
    

