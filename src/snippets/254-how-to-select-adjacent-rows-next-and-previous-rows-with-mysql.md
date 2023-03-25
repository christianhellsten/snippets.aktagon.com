---
id: '254'
title: How to select adjacent rows (next and previous rows) with MySQL
languages:
- ruby
tags:
---
I've now packaged this into a Rails plugin called [has\_adjacent\_finders](http://github.com/christianhellsten/has_adjacent_finders/tree/master)

Problem
-------

Finding the next and previous product is a common task on, for example, e-commerce sites.

Let's say we have a table containing data having the following IDs:


```ruby
201
202
203
204
205
206
207
208
```
    

How do we get the rows adjacent to row 205? We can rely on MySQL sorting&mdash;the primary key in this case&mdash; so these two queries will do the job for us:


```ruby
# Find previous row
select id from products where id < 205 order by id desc limit 1

# Find next row
select id from products where id > 205 order by id asc limit 1
```
    

The two queries will return 204 and 206 respectively. You can also use other columns, not just ID...

