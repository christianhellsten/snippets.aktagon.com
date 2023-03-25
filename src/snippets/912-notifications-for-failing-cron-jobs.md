---
id: '912'
title: Notifications for failing cron jobs
languages:
- bash
tags:
---
Here's a simple way of receiving a notification to a Slack channel when a cron job fails:

```bash
#!/usr/bin/env sh

# Replace this with the command
echo "hello world" &> /var/log/app.log

if [ $? -eq 0 ]
then
  curl -X POST -H 'Content-Type: application/json' --data "{\"text\":\"Cron job ran successfully $(tail -n 5 /var/log/app.log)\"}" $SLACK_URL
  exit 0
else
  curl -X POST -H 'Content-Type: application/json' --data "{\"text\":\"Cron job failed $(tail -n 5 /var/log/app.log)\"}" $SLACK_URL
  exit 1
fi
```

Set the SLACK_URL environment variable to your slack channel's hook URL.

A message will be sent to the Slack channel whenever the command fails along with the last 5 lines from the log file.
