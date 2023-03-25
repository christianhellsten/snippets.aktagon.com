---
id: '746'
title: Postgres substring search with trigrams
languages:
- sql
tags:
---
What we have is:
\* a table "companies" and a column "name"
\* Postgres and the [pgtrgm extension](http://www.postgresql.org/docs/9.3/static/pgtrgm.html)
\* a company named "Berkshéiße"

Let's enable the trigram extension:


```sql
-- $ psql app_schema -U superuser
CREATE EXTENSION pg_trgm;
```
    

Now we can search for trigrams, including [shèiß]()


```sql
-- $ psql app_schema -U user
SELECT * FROM companies WHERE name ~* 'shèiß';
```
    

The query returns nothing, so let's do this instead:
\* install the [unaccent](http://www.postgresql.org/docs/9.3/static/unaccent.html) extension
\* create an "immutable unaccent" function
\* apply "unaccent" and "lower" to the query
\* apply "unaccent" and "lower" to the index


```sql
-- $ psql app_schema -U superuser
CREATE EXTENSION unaccent;
```
    


```sql
-- $ psql app_schema -U user
--DROP INDEX companies_name_search_idx;
CREATE OR REPLACE FUNCTION f_unaccent(text)
  RETURNS text AS
$func$
SELECT unaccent('unaccent', $1)
$func$  LANGUAGE sql IMMUTABLE SET search_path = public, pg_temp;
CREATE INDEX companies_name_search_idx ON companies USING gin(f_unaccent(name) gin_trgm_ops);
```
    

Finally, the query returns what we're looking for:


```sql
-- Plain SQL
SELECT * FROM companies WHERE lower(f_unaccent(name)) LIKE ('%' || lower(f_unaccent('shèiß')) || '%');
-- With pg_trgrm syntax
SELECT * FROM companies WHERE lower(f_unaccent(name) ~* lower(f_unaccent('shéiße'));
-- Look, even this works
SELECT * FROM companies WHERE lower(f_unaccent(name) ~* lower(f_unaccent('shEiSe'));
```
    

If Postgres still doesn't use the index we created, it's probably because it's faster to scan the table than using the index.

Notes
-----

\* The WHERE-condition must match the index definition:


```sql
-- yes
lower(unaccent_text(name) ~* lower(unaccent_text('shéiße'))
-- no
name ~* lower(unaccent_text('shéiße'))
-- no
name ~* unaccent_text('shéiße')
```
    

References
----------

\* [Erwin Brandstetter: Does PostgreSQL support “accent insensitive” collations?](http://stackoverflow.com/questions/28627951/postgresql-accent-case-insensitive-search/28636000#28636000)
\* [Erwin Brandstetter: PostgreSQL accent + case insensitive search
](http://stackoverflow.com/questions/11005036/does-postgresql-support-accent-insensitive-collations/11007216#11007216)

