---
id: '745'
title: Extract Git directory to new repository
languages:
- bash
tags:
---
This will extract lib/module\_b sub directory to a new Git repository while preserving Git history for that sub directory:


```bash
git clone https://github.com/xxx/module-a.git module-b
cd module-b
git remote rm origin
git filter-branch --subdirectory-filter lib/module_b -- --all
```
    

[Via](http://gbayer.com/development/moving-files-from-one-git-repository-to-another-preserving-history/)

