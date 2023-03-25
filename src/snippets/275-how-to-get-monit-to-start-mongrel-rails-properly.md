---
id: '275'
title: How to get  monit to start mongrel_rails properly
languages:
- bash
tags:
- database
- diff
- postgres
---
Mongrel\_rails and monit are not the best of friends. It's difficult to get them to work together.

For example, this is the error I got in my monit logs when switching to a new mongrel\_rails command that cleans up stale pids:


```bash
'mongrel_1' process is not running
'mongrel_2' trying to restart
'mongrel_3' start: /usr/local/bin/mongrel_rails
'mongrel_4' failed to start
```
    

To fix it I added the following start\_command to the monit configuration:


```bash
/usr/bin/env PATH=/usr/local/bin/:$PATH mongrel_rails cluster::start -C /var/www.... --clean --only 8000
```
    

The problem is that monit overrides the PATH environment variable, so it won't find mongrel\_rails unless you tell it where to find it.
Monit also contains a bug which doesn't tell you why it can't start mongrel\_rails, but that's another story...

Note that I'm using the --clean switch which will startup the mongrels even if a stale pid exists.

In fact I got so tired of the whole mess I wrote a plugin that [generates a working monit configuration for mongrel\_rails](http://github.com/christianhellsten/monit_conf/) from one or more mongrel\_cluster.yml configuration files.

