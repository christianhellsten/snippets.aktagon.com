---
id: '86'
title: How to list and sort directories by size in Linux/Unix
languages:
- bash
tags:
---
For human-readable output use the following command:

```bash
du -sh /* | sort -h
```

Use this command to find the directories taking up the most space:

```bash
du -k | sort -nr | more
```
    

The **du** command along with the **-k** switch lists all directories and their respective size in kilobytes.
The **sort** command sorts the output so that the largest directory is shown first in the list. The **-nr** switch reverses the list and uses only numbers when sorting.

Here's an example of the output:


```bash
12939451  .
1814892  ./abcdef
1219582  ./abcde
839586  ./abcd
718330  ./abc
695610  ./ab
690380  ./a
```

