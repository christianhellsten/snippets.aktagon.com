---
id: '723'
title: How to get notified when a Cron job fails
languages:
tags:
---
To get notified when a cron script fails you can tell cron to send any errors to you by email.

It already does this by default, but the emails are sent to the Unix account's mailbox:


```
cat /var/spool/mail/<username> | less
```
    

To use a different email address use the MAILTO setting as described [here](http://serverfault.com/a/226081):


```
MAILTO=email@example.com
0 */2 * * * /bin/backup.sh > /dev/null
```
    

Cron will now send an email whenever the script (/bin/backup.sh) prints something to stderr.

If the script is printing to stderr without it failing try [Cronic](http://habilis.net/cronic/):


```
0 */2 * * * cronic /bin/backup.sh
```
    

You can of course also try to fix the script by not printing to STDERR unless it's really an error.

Check the mail log to see if it's working:


```
sudo tail -f /var/log/mail.log
```
    

If you're email server is rejecting emails sent by cron you might need to set the MAILFROM variable. However, only some cron version supports MAILFROM.

