---
id: '934'
title: How to set the environment variables in a cron script (Docker)
languages:
- bash
tags:
---
To give your cron script access to the same environment variables as the Docker container, you can read and export the environment variables for the PID 1 process in your script:

```bash
crontab -l
* * * * * /app/run.sh jobs.xxx
```

/app/run.sh

```bash
#!/usr/bin/env bash
# Read the environment variables for the main process (PID 1) running in the Docker container:
export $(xargs -0 -a "/proc/1/environ")

python3 -m $1
```
