---
id: '101'
title: 'Solution for "Kernel panic: CPU too old for this kernel" when installing Ubuntu
  on Parallels'
languages:
- bash
tags:
---
If you get this error on Mac OSX when using Parallels:


```bash
Kernel panic: CPU too old for this kernel.
```
    

Set the image to boot from CD. In rescue mode open a shell and run the following to install a new kernel:


```bash
apt-get update
apt-get install linux-386
apt-get remove linux-server
```
    

