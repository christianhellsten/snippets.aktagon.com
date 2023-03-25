---
id: '913'
title: Handling invalid CSV quoting with PostgreSQL's "COPY FROM"
languages:
- sql
tags:
---
PostgreSQL "COPY FROM" not importing all CSV rows and not reporting any errors?

This is an example of how to use a character that does not exist in the CSV file as a quote character to fix and handle invalid quoting issues:

```sql
CREATE TABLE xxx (
  id SERIAL,
  name VARCHAR,
  value VARCHAR,
  PRIMARY KEY (id)
);
COPY xxx(name, value)
FROM 'xxx.txt'
DELIMITER E'\t'
-- Use a character that does not exist in the CSV file as quote character to handle quoting
QUOTE E'\x01'
ENCODING 'utf8'
CSV HEADER;
```

Best of luck...
