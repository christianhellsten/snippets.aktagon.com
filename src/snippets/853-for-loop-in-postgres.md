---
id: '853'
title: For loop in Postgres
languages:
- sql
tags:
---
```sql
DO
$$
DECLARE
    row record;
BEGIN
    FOR row IN SELECT tablename FROM pg_tables WHERE schemaname = 'public'
    LOOP
        EXECUTE 'ALTER TABLE public.' || quote_ident(row.tablename) || ' SET SCHEMA <new schema>;';
    END LOOP;
END;
$$;
```
