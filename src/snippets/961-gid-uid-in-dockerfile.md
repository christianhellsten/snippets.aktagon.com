---
id: '961'
title: gid, uid in Dockerfile
languages:
- bash
tags:
---
```bash
# Debian
RUN addgroup --gid 10000 app && adduser --gid 10000 --uid 10001 app && chown -R app /app/ && chgrp -R app /app/ && chmod -R 740 /app/

# Alpine
RUN addgroup --gid 10000 app && adduser -u 10001 app -D -G app && chown -R app /app/ && chgrp -R app /app/ && chmod -R 740 /app/
```

Add the user to the host system too.
