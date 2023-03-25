---
id: '883'
title: Procfile dependencies
languages:
- bash
tags:
---
You can use the **sleep** command as a way of specifying dependencies in a Procfile even if dependencies are not explicitly supported.

For example:

```bash
redis:        redis-server
sidekiq:      sleep 5; bundle exec sidekiq
rails:        sleep 5; bundle exec rails
proxy:        sleep 10; haproxy -c haproxy.cfg
```
