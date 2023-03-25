---
id: '524'
title: How to move a local Git repository to a shared server
languages:
- apacheconf
tags:
- after
- before
- function
- postgresql
- window
---
Short version:


```apacheconf
# On server
git init --bare /var/www/xyz/frontend.git

# On local
git remote add server xxx@xyz.com:/var/git/frontend.git
git push server master
```
    

Longer version:


```apacheconf
# On local computer
git clone --bare . xxx.git
tar cvf xxx.tar xxx.git
scp xxx.tar xxx.com://tmp

# On remote server
cd /var/git/repositories
tar xvf /tmp/xxx.tar

# On local computer
git remote add origin ssh://john@xxx.com/var/git/repositories/xxx.git
git push origin master
```
    

