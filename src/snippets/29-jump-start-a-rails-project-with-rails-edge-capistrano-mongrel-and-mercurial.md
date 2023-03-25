---
id: '29'
title: Jump start a Rails project with Rails Edge, Capistrano, Mongrel and Mercurial
languages:
- bash
tags:
- csv
- cut
- unix
---

```bash
# Create a Rails project
rails project -d sqlite3
cd project
# Delete index file
rm public/index.html
# Use Rails edge. Use  rake rails:freeze:edge TAG=rel_1-2-3 to get a specific version.
rake rails:freeze:edge
# Add Capistrano configuration file
capify .
# Add Mongrel cluster configuration file
sudo mongrel_rails cluster::configure -e production \
    --user mongrel --group mongrel \
    -c /var/www/project-xxx/current \
    -a 127.0.0.1 \
    -p 8000  \
    -N 3
# Create a Mercurial repository
hg init
# Add project to repository
hg commit -A --message "Project started"
# Push changes to a remote repository
hg push ssh://user@ip:port//var/mercurial/xxx
```
    

Cloning is done with hg clone:


```bash
hg clone ssh://user@ip:port//var/mercurial/xxx
```
    

