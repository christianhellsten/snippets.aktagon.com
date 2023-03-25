---
id: '65'
title: Resize an LVM volume
languages:
- bash
tags:
- quarters
- ruby
---
Step by step instructions on how an incorrectly configured /home was resized to 5Gb on one of our servers.


```bash
umount /home
e2fsck -f /dev/mapper/aktagon--1-home
resize2fs /dev/mapper/aktagon--1-home 5G
lvreduce -L 5G aktagon-1/home
mount /home
```
    

First /home was unmounted as a precaution. Then the filesystem was fsck'ed. After that the file system was resized to 5Gb and finally the underlying LVM logical volume was resized.

