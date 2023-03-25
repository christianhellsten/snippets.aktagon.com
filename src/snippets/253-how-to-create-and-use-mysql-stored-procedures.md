---
id: '253'
title: How to create and use MySQL stored procedures
languages:
- sql
tags:
---
This is a simple example of a MySQL stored procedure that has both an in and out parameter:


```sql
DELIMITER |
DROP PROCEDURE IF EXISTS category_for |
CREATE PROCEDURE category_for (product_id int, OUT r_category_id INT)
 BEGIN
  DECLARE category_id INT;
  DECLARE products_cursor CURSOR FOR SELECT category_id FROM products where id = product_id;
  OPEN products_cursor;
   FETCH products_cursor INTO category_id;
  CLOSE products_cursor;
  SET r_category_id 	= category_id;
 END |
DELIMITER ;
```
    

Note that we use ; inside the procedure so we have to set the delimiter to | temporarily.

To call the stored procedure use the following SQL commands:


```sql
CALL category_for(202, @category_id);
```
    

The @category\_id session variable will now contain the procedure's output:


```sql
select @category_id;
+-------+
| @category_id |
+-------+
| 3     | 
+-------+
```
    

