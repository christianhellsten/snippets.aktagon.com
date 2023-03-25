---
id: '94'
title: How to reset the MySQL root password
languages:
- bash
tags:
---
I just happened to lock myself out of MySQL, but luckily I have root access to the server so I can reset it easily by first shutting down MySQL:


```bash
/etc/init.d/mysql stop
```
    

And then creating a MySQL init file with the desired password:


```bash
$ echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('1234');" >> /tmp/mysql_init.txt
```
    

Starting MySQL with the **--init-file** parameter like this resets the password:


```bash
$ mysqld_safe --init-file=/tmp/mysql_init.txt
```
    

Remember to delete the file:


```bash
rm /tmp/mysql_init.txt
```
    

