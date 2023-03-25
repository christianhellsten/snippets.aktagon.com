---
id: '115'
title: Transfer partition from one server to another
languages:
- bash
tags:
---
The following is an example of how to transfer a partition from one server to another.

In the example, I first create a file containing the partition, and then transfer the partition to the other server.


```bash
dd if=/dev/xen-1/aktagon.com-disk of=/tmp/file
scp /tmp/file username@host:/file
```
    

I then SSH to the other server and create the partition from the file.


```bash
ssh host
lvcreate -L 4G /dev/VG00/aktagon.com-disk
cat aktagon.com-disk.bz2 > /dev/aktagon-1/aktagon.com-disk
```
    

Remember to create a backup before running these commands.

