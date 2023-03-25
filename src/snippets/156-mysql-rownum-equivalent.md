---
id: '156'
title: MySQL rownum equivalent
languages:
- sql
tags:
- fswatch
- rspec
---
MySQL doesn't have rownum, but user variables can be used as a replacement:


```sql
select @rownum:=@rownum+1 'rank', p.* from products p, (SELECT @rownum:=0) r order by created_at desc limit 10;
```
    

Read more: [MySQL 5.0 Reference Manual](http://dev.mysql.com/doc/refman/5.0/en/user-variables.html)

