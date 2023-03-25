---
id: '121'
title: Fixing slowdown of X after installing 4Gb of RAM
languages:
- bash
tags:
---
Both X and 3D acceleration of my Lenovo X61s became horrendously slow after I upgraded to 4Gb of RAM. After a while of Googling I found [a thread](http://www.rage3d.com/board/showthread.php?t=33821469) that explained why it had become slow. In my dmesg I could see the following error, which hinted me to the cause.


```bash
mtrr: type mismatch for e0000000,10000000 old: write-back new: write-combining
```
    

I want to emphasize that I'm not the author of this script. But I want to store it here because forums and topics sometimes disappear. The original author seems to be "hubick" of the thread linked above. For me this script was plug & play, so many props to the original author if you happen to read this ;) I just needed to run it before X was started.


```bash
#!/bin/sh
# Fixup /proc/mtrr
#
# chkconfig: 12345 0 99
# description: Fixup /proc/mtrr
#
# Save this file as /etc/init.d/mtrrfixup and
# use "chkconfig --add mtrrfixup"
# to have this script run by init when the system starts.
#
# The default mtrr table after boot looks like the following:
# reg00: base=0xd8000000 (3456MB), size= 128MB: uncachable, count=1
# reg01: base=0xe0000000 (3584MB), size= 512MB: uncachable, count=1
# reg02: base=0x00000000 (   0MB), size=4096MB: write-back, count=1
# reg03: base=0x100000000 (4096MB), size= 512MB: write-back, count=1
# reg04: base=0x120000000 (4608MB), size= 128MB: write-back, count=1
# reg05: base=0xd7f80000 (3455MB), size= 512KB: uncachable, count=1
#
# The main problem is entry 1, which covers
# the AGP aperature and Video Card memory.
# Being present and uncachable, it prevents
# the fglrx driver module from using/creating a
# write-combined region for the video card.
# The second problem is entry 2, covering all
# our ram, which prevents us from creating
# any new sections which aren't uncachable.
#
# We have a maximum of 7 mtrr registers.
# All sizes must be a power of two.
# The start and end of any page must
# have the same 'upper bits'.

# First remove all existing values...
# Order matters - wrong order locks system hard!
echo "disable=2" >| /proc/mtrr
echo "disable=5" >| /proc/mtrr
echo "disable=1" >| /proc/mtrr
echo "disable=3" >| /proc/mtrr
echo "disable=4" >| /proc/mtrr
echo "disable=0" >| /proc/mtrr

# Now create the right ones...

# Main Memory: 0-2048,2048-3072,3072-3328,3328-3456
# These are powers of two, they get progressively smaller
# so we can get right up to the system device page below.
echo "base=0x00000000 size=0x80000000 type=write-back" >| /proc/mtrr
echo "base=0x80000000 size=0x40000000 type=write-back" >| /proc/mtrr
echo "base=0xC0000000 size=0x10000000 type=write-back" >| /proc/mtrr
echo "base=0xD0000000 size=0x08000000 type=write-back" >| /proc/mtrr

# System Devices: 3456-3584
echo "base=0xD8000000 size=0x08000000 type=uncachable" >| /proc/mtrr

# AGP Aperature: 3584-3712
echo "base=0xE0000000 size=0x08000000 type=write-combining" >| /proc/mtrr

# Video Card: 3712-3840
echo "base=0xE8000000 size=0x08000000 type=write-combining" >| /proc/mtrr

# High memory area: 4096-5096
echo "base=0x100000000 size=0x40000000 type=write-back" >| /proc/mtrr
```
    

