---
id: '15'
title: Log file analysis with AWK - Calculating the sum and average
languages:
- bash
tags:
---
This AWK script is useful when you want to calculate the average and sum for a set of values found in a log file.


```bash
awk '{ s += $1 } END { print "sum: ", s, " average: ", s/NR, " samples: ", NR }' rails_production_log_or_whatever.log
```
    

Note that **$1** means that column one contains the values you want to use. **NR** is the total number of rows in the file. As an example, let's say you have this log file:


```bash
1
2
3
4
5
```
    

The output would then be:


```bash
sum:  15  average:  3  samples:  5
```
    

Combine it with **grep** or **sed** to do more advanced log file analysis -- you can for example calculate the average time it took to render action xyz in Rails on the 21th of July at 21:00 PM.

Note that by default the column values should be space separated--use the following switch to parse CSV (comma separated) files: **-F,**

