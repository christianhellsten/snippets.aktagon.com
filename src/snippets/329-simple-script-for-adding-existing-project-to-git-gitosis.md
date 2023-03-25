---
id: '329'
title: Simple script for adding existing project to git/gitosis
languages:
- bash
tags:
- database
- golang
- session
- sql
- timestamp
---

```bash
GIT_USER=git
SERVER=xxx.com
APP=xxx

touch tmp/.gitignore log/.gitignore vendor/.gitignore
find . -type d -empty | grep -v "vendor" | grep -v ".git" | grep -v "tmp" | xargs -I xxx touch xxx/.gitignore

cat <<EOF >>.gitignore
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
*.swp
Capfile
EOF

git init
git add .
git commit -m "initial commit" 
git remote add origin $GIT_USER@$SERVER:$APP.git
git push origin master
```
    

