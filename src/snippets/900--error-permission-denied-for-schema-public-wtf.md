---
id: '900'
title: '"ERROR:  permission denied for schema public" WTF'
languages:
- sql
tags:
---
If you get this error:

```sql
ERROR:  permission denied for schema history
```

And, you're running a query such as, for example, this one:

```sql
SELECT 1 FROM ONLY "history"."dummytafvel" x WHERE "id" OPERATOR(pg_catalog.=) $1 FOR KEY SHARE OF x;
```

And, your user has been granted access to the schema:

```sql
GRANT ALL ON history TO myself_and_i;
```

Then, you might have been hit over the head by the "permission denied for schema even as superuser" feature in PostgreSQL:

> That's a foreign key checking query.FK checks are done as the owner of
> the target table, not as the user who did the original query. So your
> problem is that the owner of the table lacks permissions
> to access the other table (or more specifically, the schema it's in). 

The solution is to grant access to the owner of the foreign keys to the schema in question.

## References

https://sharingtechknowledge.blogspot.com/2012/03/postgresql-foreign-key-checking.html
