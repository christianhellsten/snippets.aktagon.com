---
id: '66'
title: Quick step by step on creating a xen environment in Debian Etch
languages:
- bash
tags:
- action
- http
- parameter
- rails
- reserved
---
Jumpstart with Xen out-of-the-box in Debian Etch stable.


```bash
sudo apt-get install xen-tools xen-hypervisor linux-image-xen-amd64 bridge-utils iproute sysfsutils
# [reboot into xen kernel now]
sudo xen-create-image --hostname=db2.aktagon.com \
--size=10Gb --swap=256Mb --ip=10.0.0.51 \
--netmask=255.255.255.0 --gateway=10.0.0.2 \
--force --dir=/work/vserver --memory=512Mb \
--arch=i386 --kernel=/boot/vmlinuz-2.6.18-5-xen-amd64 \
--debootstrap --dist=etch \
--mirror=http://ftp.funet.fi/pub/linux/mirrors/debian/ \
--passwd
sudo xm create /etc/xen/db1.aktagon.com.cfg
```
    

