---
id: '11'
title: Mount a network drive with proper privileges
languages:
- bash
tags:
- dockerfile
- gid
- uid
---
This is not a snippet either, but I always forget how the local permissions for a Samba mount are given, which is the reason I put it here. Uid is the id of the user you want to mount the drive as, and gid is respectively the group id. Username is the username you want to connect with.


```bash
sudo mount -t smbfs -o uid=1000,gid=1000,username=marko //remote_server/work /mnt/net/stage/work
```
    

