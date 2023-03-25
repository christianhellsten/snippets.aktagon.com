---
id: '222'
title: Resizing LVM partition that is on a crypted device.
languages:
- bash
tags:
- activerecord
- rails
---
I installed [sysrescd](http://www.sysresccd.org/Sysresccd-manual-en_How_to_install_SystemRescueCd_on_an_USB-stick) on an USB stick to resize a partition that had too little space on it. The hitch was that it was on an encrypted partition. This is the correct order of the commands that needed to be issued.

sda3 is the encrypted device
systemvg is the name of the volume group
lv\_usr is the name of the logical volume


```bash
cryptsetup luksOpen /dev/sda3 crypt
vgcreate systemvg /dev/mapper/crypt
lvm vgchange --ignorelockingfailure -P -a y
lvextend -L+2G /dev/systemvg/lv_usr
e2fsck -f /dev/systemvg/lv_usr
resize2fs /dev/systemvg/lv_usr
```
    

