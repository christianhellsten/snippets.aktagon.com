---
id: '37'
title: Enable your favorite editor in production environment.
languages:
- bash
tags:
---
Anyone who's ever set up or maintained a larger production environment will love this "snippet". Production environments seldom contain your favorite editor. In fact, most times you are stuck with vi, which is fine if that happens to be your flavor. For most people vi just doesn't fit. The only requirement for this trick is to have SSH access into the production environment.

Firstly install sshfs on your development computer.


```bash
sudo apt-get install sshfs
```
    

It should work for both major Debian derivates (Debian and various versions of Ubuntu). I know from experience that it works for Etch stable. If you don't use a package manager then go to [sshfs homepage](http://fuse.sourceforge.net/sshfs.html) and follow instructions from there.

Create a mountpoint for the production filesystem.


```bash
sudo mkdir -p /mnt/production-xyz/bea92
```
    

Mount it with sshfs using a syntax similar to scp.


```bash
sshfs marko@production_server:/opt/bea92 /mnt/production-xyz/bea92
```
    

Fire up your favorite editor and start setting up/maintaining the production environment with a smile on your face :) Once you're done unmount it using the command below.


```bash
fusermount -u /mnt/production-xyz/bea92
```
    

