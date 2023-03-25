---
id: '601'
title: Running (and debugging) cronjobs with rbenv and bundler
languages:
- bash
tags:
---
This snippet shows how to run a backup script ([Backup gem](https://github.com/meskyanichi/backup)) and how to debug cron in case it doesn't work.

This example uses bundler and rbenv to complicate things:


```bash
# Set the path to include rbenv
PATH=$PATH:/home/xxx/.rbenv/shims/:/home/xxx/.rbenv/bin/:/bin:/usr/bin/

# Debug cron environment...
*/1 * * * * /bin/bash -l -c '/bin/env > /tmp/cron-env.log'

# Run backup every 12 hours
* */12 * * * /bin/bash -l -c 'eval "$(rbenv init -)" && cd /var/www/xxx/current && bundle exec backup perform --trigger xxx -c config/backup.rb >> /tmp/backup.log 2>&1'
```
    

If backup fails, check /tmp/backup.log and/or /tmp/cron-env.log.

