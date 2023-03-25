---
id: '231'
title: Mounting a remote network drive with SSHFS on OSX
languages:
- bash
tags:
---
1.  Install SSHFS

http://code.google.com/p/macfuse/

1.  Read documentation

http://code.google.com/p/macfuse/wiki/MACFUSE\_FS\_SSHFS

1.  Create symlink


```bash
ln -s /Applications/sshfs.app/Contents/Resources/sshfs-static /usr/local/bin/sshfs
```
    

1.  Mount drive


```bash
mkdir /Volumes/mount_name
sshfs -p 666 server:/ /Volumes/mount_name -oreconnect,ping_diskarb,volname=mount_name
```
    

1.  References

<http://lifehacker.com/software/ssh/geek-to-live--mount-a-file-system-on-your-mac-over-ssh-246129.php>

