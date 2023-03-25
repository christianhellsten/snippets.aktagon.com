---
id: '268'
title: 'Fix for "mysql error 1005 (errno: 150) "'
languages:
- sql
tags:
---
There are at least three reasons, that I know of, to why you could be seeing [mysql error 1005 (errno: 150)](http://dev.mysql.com/doc/refman/5.0/en/innodb-foreign-key-constraints.html)

-   Adding a foreign key constraint when column types don't match
-   Not enough privileges to execute the script
-   Trying to delete an index that is needed by some other index or constraint ("error on rename of")

Use "SHOW ENGINE INNODB STATUS;" to view the error:


```sql
ALTER TABLE videos ADD constraint fk_videos_channels_id FOREIGN KEY (channel_id) REFERENCES channels (id);
SHOW ENGINE INNODB STATUS;
```
    

