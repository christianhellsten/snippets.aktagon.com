---
id: '910'
title: Refreshing all materialized views in the correct order with one command
languages:
- sql
tags:
---
The following code is from https://wiki.postgresql.org/wiki/Refresh_All_Materialized_Views:

```sql
CREATE OR REPLACE VIEW mat_view_dependencies AS
WITH RECURSIVE s(start_schemaname,start_relname,start_relkind,
		 schemaname,relname,relkind,reloid,owneroid,ownername,depth)
		 AS (
-- List of tables and views that mat views depend on
SELECT n.nspname AS start_schemaname, c.relname AS start_relname,
c.relkind AS start_relkind,
n2.nspname AS schemaname, c2.relname, c2.relkind,
c2.oid AS reloid,
au.oid AS owneroid,
au.rolname AS ownername,
0 AS depth
FROM pg_class c JOIN pg_namespace n
     ON c.relnamespace=n.oid AND c.relkind IN ('r','m','v','t','f')
JOIN pg_depend d ON c.oid=d.refobjid
JOIN pg_rewrite r ON d.objid=r.oid
JOIN pg_class c2 ON r.ev_class=c2.oid -- AND c2.relkind='m'
JOIN pg_namespace n2 ON n2.oid=c2.relnamespace
JOIN pg_authid au ON au.oid=c2.relowner

UNION

-- Recursively find all mat views depending on previous level
SELECT s.start_schemaname, s.start_relname, s.start_relkind,
n.nspname AS schemaname, c2.relname,
c2.relkind, c2.oid,
au.oid AS owneroid, au.rolname AS ownername,
s.depth+1 AS depth
FROM s
JOIN pg_depend d ON s.reloid=d.refobjid
JOIN pg_rewrite r ON d.objid=r.oid
JOIN pg_class c2 ON r.ev_class=c2.oid AND (c2.relkind IN ('m','v'))
JOIN pg_namespace n ON n.oid=c2.relnamespace
JOIN pg_authid au ON au.oid=c2.relowner

WHERE s.reloid <> c2.oid -- exclude the current MV which always depends on itself
)
SELECT * FROM s;

--------------------------------------------------
--- A view that returns the list of mat views in the
--- order they should be refreshed.
--------------------------------------------------
CREATE OR REPLACE VIEW mat_view_refresh_order AS
WITH b AS (
-- Select the highest depth of each mat view name
SELECT DISTINCT ON (schemaname,relname) schemaname, relname, ownername, depth
FROM mat_view_dependencies
WHERE relkind='m'
ORDER BY schemaname, relname, depth DESC
)
-- Reorder appropriately
SELECT schemaname, relname, ownername, depth AS refresh_order
FROM b
ORDER BY depth, schemaname, relname
;
```

We can now write a custom function to execute the refresh of all materialized views in the correct order:

```sql
CREATE OR REPLACE FUNCTION refresh_materialized_views () RETURNS VOID AS
$$
DECLARE
BEGIN
  EXECUTE (SELECT string_agg('REFRESH MATERIALIZED VIEW "' || schemaname || '"."' || relname || '";', '' ORDER BY refresh_order) AS script FROM mat_view_refresh_order);
END;
$$ LANGUAGE plpgsql;
```

We use a simple select to execute the dynamically generated SQL
```sql
SELECT refresh_materialized_views();
```
