---
id: '751'
title: How to take a backup of a Postgres database
languages:
- bash
tags:
---
This is one way of doing it:


```bash
pg_dump -s yamaha_development > structure.sql
pg_dump --column-inserts --data-only yamaha_development  > data.sql
```
    

You can then restore it to a different database if needed:


```bash
psql -c 'drop database yamaha_test;'
psql -c 'create database yamaha_test;'

psql yamaha_test < structure.sql
psql yamaha_test < data.sql
```
    

All without foreign key constraint, etc, errors.

