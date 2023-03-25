---
id: '442'
title: Using rsync to backup a remote machine to a local directory via SSH
languages:
- bash
tags:
---
This command copies the files on the remote machine 127.0.0.1 to the local directory /backups/127.0.0.1:


```bash
rsync --delete -r -ve "ssh -p 666" 127.0.0.1:/var/www/ /backups/127.0.0.1
```
    

Some useful parameters:


```bash
-r = recursive
-n = simulate
-v = verbose
-a = archive mode
-L = follow symbolic links
--size-only = 
--progress = show progress indicator
--numeric-ids = don't map user and group IDs to local user and group names
-e = use SSH and port 666
--bwlimit = limit bandwidth to 100 kilobytes/second
--exclude-from = exclude the files and directories listed in the configuration file
--delete = remove local files that have been removed on the remote server
```
    

