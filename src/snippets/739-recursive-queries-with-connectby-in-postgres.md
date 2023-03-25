---
id: '739'
title: Recursive queries with connectby in Postgres
languages:
- sql
tags:
---
Create an organization hierarchy and display the organization from the top:


```sql
CREATE EXTENSION "tablefunc";
CREATE TABLE organizations(id text, parent_id text, pos int);

INSERT INTO organizations VALUES('row1',NULL, 0);
INSERT INTO organizations VALUES('row2','row1', 0);
INSERT INTO organizations VALUES('row3','row1', 0);
INSERT INTO organizations VALUES('row4','row2', 1);
INSERT INTO organizations VALUES('row5','row2', 0);
INSERT INTO organizations VALUES('row6','row4', 0);
INSERT INTO organizations VALUES('row7','row3', 0);
INSERT INTO organizations VALUES('row8','row6', 0);
INSERT INTO organizations VALUES('row9','row5', 0);

-- Fetch self and descendants for row1
SELECT * FROM connectby('organizations', 'id', 'parent_id', 'row1', 0, '~') AS t(id text, parent_id text, level int, branch text);
```
    

Output:


```sql
id  | parent_id | level |          branch
------+-----------+-------+--------------------------
 row1 |           |     0 | row1
 row2 | row1      |     1 | row1~row2
 row4 | row2      |     2 | row1~row2~row4
 row6 | row4      |     3 | row1~row2~row4~row6
 row8 | row6      |     4 | row1~row2~row4~row6~row8
 row5 | row2      |     2 | row1~row2~row5
 row9 | row5      |     3 | row1~row2~row5~row9
 row3 | row1      |     1 | row1~row3
 row7 | row3      |     2 | row1~row3~row7
```
    

Usually it's better to use recursive CTE queries:


```sql
WITH RECURSIVE organization_tree AS (
  SELECT 
  	id, parent_id 
  FROM
  	organizations
  WHERE
  	id = 'row1'
UNION ALL
  SELECT 
  	organizations.id, organizations.parent_id 
  FROM 
  	organizations, organization_tree
  WHERE
  	organizations.parent_id = organization_tree.id
) select * from organization_tree;
```
    

