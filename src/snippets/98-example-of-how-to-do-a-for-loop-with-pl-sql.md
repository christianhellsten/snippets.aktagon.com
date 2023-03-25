---
id: '98'
title: Example of how to do a for loop with PL/SQL
languages:
- sql
tags:
- configuration
- dot-notation
- ruby
---
A PL/SQL example of a for loop that prints out the primary key for all rows returned by a query:


```sql
DECLARE
  ID VARCHAR2(50);
BEGIN
    DBMS_OUTPUT.ENABLE (1000000);
    FOR current_row IN (SELECT id FROM your_table)
	LOOP
		ID := current_row.id;    -- Assign value to variable
		DBMS_OUTPUT.PUT_LINE( '' || ID);
		DBMS_OUTPUT.PUT_LINE( '' || current_row.column_xxx);
	END LOOP;
END;
/
```
    

