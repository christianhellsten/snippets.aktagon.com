---
id: '774'
title: How to monitor database backups with monit
languages:
tags:
---
## "It's not the backup, it's the restore"

We want to know when our database backup process, including restore, is broken. We can use monit to monitor that our database:
- is being backed up, i.e., that the backup script is being run periodically
- can be restored from a backup, i.e., that the backup is not corrupted 

More specifically we want to monitor the following:
- the backup has been run within last the 24 hours with https://mmonit.com/monit/documentation/monit.html#TIMESTAMP-TESTING
- the backup size is at least n MB https://mmonit.com/monit/documentation/monit.html#FILE-SIZE-TESTING
- the backup contains SQL https://mmonit.com/monit/documentation/monit.html#FILE-CONTENT-TESTING

We use monit to monitor the script that restores the database from a backup. For this we need:
- a script, e.g. written in Ruby, that restores the database from a fresh backup
    - the script should write to a log file, e.g. /var/log/db-restore.log, after the database has been successfully restored
    - the script should check facts such as, e.g., number of rows
    
- a monit script that checks the script has been run successfully within, e.g., the last 24 hours
    - this is done by checking the timestamp of the log file, e.g. /var/log/db-restore.log, with: https://mmonit.com/monit/documentation/monit.html#TIMESTAMP-TESTING
