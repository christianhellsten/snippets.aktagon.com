---
id: '144'
title: Scheduling jobs to run daily, weekly or monthly with Cron
languages:
- bash
tags:
---
Cron syntax and valid values:


```bash
# +---------------- minute (0 - 59)
# |  +------------- hour (0 - 23)
# |  |  +---------- day of month (1 - 31)
# |  |  |  +------- month (1 - 12)
# |  |  |  |  +---- day of week (0 - 6) (Sunday=0 or 7)
# |  |  |  |  |
  *  *  *  *  *  command to be executed
```
    

Below are a few examples on how to run a script every 10 minutes, every 30 minutes, every hour, daily, weekly, monthly.

Execute **crontab -e** and add the following (see **man crontab**):


```bash
# Every 10 minutes
*/10 * * * * /home/belsebub/delete_old_stuff.sh

# Every 30 minutes
*/30 * * * * /home/belsebub/delete_old_stuff.sh

# Every 60 minutes
*/60 * * * * /home/belsebub/delete_old_stuff.sh

# Every day at 00:00
00 00 * * * /home/belsebub/delete_old_stuff.sh

# Every saturday at 00:00
00 00 * * 6 /home/belsebub/delete_old_stuff.sh

# First day of every month at 00:00
00 00 1 * * /home/belsebub/delete_old_stuff.sh
```
    

On Debian the configuration goes to **/var/spool/cron/crontabs/username**.

