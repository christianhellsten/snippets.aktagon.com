---
id: '820'
title: SQL for generating a report for each month of the year using PostgreSQL's crosstab
languages:
- sql
tags:
---
This is the report we want to generate:
```sql
┌──────────────────────────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬─────┬─────┐
│           key            │  jan  │  feb  │  mar  │  apr  │  may  │  jun  │  jul  │  aug  │  sep  │  oct  │ nov │ dec │
├──────────────────────────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼─────┼─────┤
│ Christian                │ 4209  │ 3627  │ 3686  │ 3109  │ 3605  │ 3506  │ 2892  │ 3380  │ 3262  │ 1821  │ ¤   │ ¤   │
│ Barney                   │ 17188 │ 17139 │ 16622 │ 14096 │ 17302 │ 17063 │ 13372 │ 16277 │ 16672 │ 9263  │ ¤   │ ¤   │
│ Donald                   │ 16078 │ 14627 │ 16518 │ 14241 │ 16397 │ 16655 │ 15739 │ 17639 │ 16178 │ 9588  │ ¤   │ ¤   │
│ Duck                     │ 9369  │ 9099  │ 10640 │ 9184  │ 10489 │ 10332 │ 9711  │ 11108 │ 10405 │ 6338  │ ¤   │ ¤   │
│ Jebus                    │ 17774 │ 16433 │ 18502 │ 15877 │ 17918 │ 17411 │ 15900 │ 18175 │ 17149 │ 10141 │ ¤   │ ¤   │
└──────────────────────────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴─────┴─────┘
```

You need the crosstab function which can be found in the tablefunc extension:

```sql
CREATE EXTENSION tablefunc;
```

Now generate the report using the crosstab function:

```sql
SELECT * 
FROM CROSSTAB(
  'SELECT key, month, SUM(value) FROM people_statistics WHERE month >= ''2017-01-01'' GROUP BY key, month ORDER BY key',
  'SELECT (DATE ''2017-01-01'' + (INTERVAL ''1'' month * generate_series(0,11)))::date')
AS
  ct_result (key bigint, jan bigint, feb bigint, mar bigint, apr bigint, may bigint, jun bigint, jul bigint, aug bigint, sep bigint, oct bigint, nov bigint, dec bigint);
```

We used the crosstab function that accepts two SQL queries as arguments. The first argument generates the rows for the query:

- Column 1 is the key or identifier for the data, e.g., person name (Christian)
- Column 2 contains the categories that will be used to pivot the data, e.g., year and month (2017-01)
- Column 3 is the value that will be displayed, e.g., number of people (12)

The second argument generates the categories which in this example are the months of the year.
