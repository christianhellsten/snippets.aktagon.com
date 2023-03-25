---
id: '235'
title: Resizing a Xen disk image partition
languages:
- bash
tags:
- ecto
- elixir
- uuid
---

```bash
# Stop & backup
xm shutdown sandbox
cp -a sandbox/ sandbox.bk

# Verify MD5 sum
md5sum sandbox/disk.img 
4976347006df34843d29c939b5fc3742  sandbox/disk.img
md5sum sandbox.bk/disk.img 
4976347006df34843d29c939b5fc3742  sandbox.bk/disk.img

# Create a 5Gb temp file
dd if=/dev/zero of=Tempfile bs=1024 count=5000000

# Append it to the existing image
cat Tempfile >> disk.img
rm Tempfile

# Resize the partition
resize2fs -f disk.img

# Check partition & start domU
fsck.ext3 disk.img
xm create -c sandbox.cfg
```
    

