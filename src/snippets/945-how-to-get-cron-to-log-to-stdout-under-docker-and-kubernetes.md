---
id: '945'
title: How to get cron to log to STDOUT under Docker and Kubernetes
languages:
- bash
tags:
---
Dockerfile

```bash
FROM python:3.9-slim-buster
...
COMMAND ["cron", "-f"]
```

By running cron as PID 1 the output is redirected to the file descriptor of PID.

To write the output from cron jobs to PID 1, you can try to redirect the output like this:

```bash
# Redirects both stderr and stdout to stdout of PID 1:
run.sh &>> /proc/1/fd/1
# Redirects stderr and stdout to stdout and stderr of PID 1:
run.sh 1>> /proc/1/fd/1 2>> /proc/1/fd/2
```

Each PID (process) has it's own file descriptors:

```bash
/proc/{PID}/fd/0 # STDIN
/proc/{PID}/fd/1 # STDOUT
/proc/{PID}/fd/2 # STDERR
```
