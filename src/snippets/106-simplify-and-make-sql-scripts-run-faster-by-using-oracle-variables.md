---
id: '106'
title: Simplify and make SQL scripts run faster by using Oracle variables
languages:
- sql
tags:
---
[Oracle variables](http://www.orafaq.com/node/515) are a great way of removing duplicate SQL statements from your Oracle SQL scripts. By using a variable, you can store the return value of a query and use it later in another, as this example illustrates:


```sql
COLUMN your_column new_value your_variable;

SELECT DISTINCT (your_column)
                                 FROM ...
                                WHERE ...;

SELECT &your_variable FROM dual;
```
    

The above example stores the value of the **SELECT DISTINCT** query in a variable named **your\_variable**. You declare the variable with **new\_value**, and set the value by executing an SQL statement that returns one row and column.

