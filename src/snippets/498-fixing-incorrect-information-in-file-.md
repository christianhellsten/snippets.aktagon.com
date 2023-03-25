---
id: '498'
title: 'Fixing Incorrect information in file: ''...'''
languages:
tags:
---
If you get this MySQL error:


```
Incorrect information in file: '...'
```
    

you might have:
\* deleted the /tmp directory
\* disabled innodb or messed with my.cnf
\* corrupt database files
\* spilled coffee on the server???

I had accidentally deleted /tmp, so running these commands saved my day:


```
mkdir /tmp
chmod 1777 /tmp
```
    

