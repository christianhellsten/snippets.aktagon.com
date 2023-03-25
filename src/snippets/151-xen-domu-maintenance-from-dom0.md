---
id: '151'
title: Xen DomU maintenance from Dom0
languages:
- bash
tags:
- firewall
- hping
- traceroute
---

```bash
xm shutdown xyz
mount -o loop disk.img /mnt/os-image/
chroot /mnt/os-image/

# Do your stuff

exit
umount /mnt/os-image
```
    

