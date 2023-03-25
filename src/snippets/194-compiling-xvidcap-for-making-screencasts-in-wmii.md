---
id: '194'
title: Compiling xvidcap for making screencasts in wmii
languages:
- bash
tags:
---
I was unable to make screencasts in [wmii](http://www.suckless.org/wiki/wmii/) using [Istanbul](http://live.gnome.org/Istanbul). So here's how I installed [xvidcap](http://sourceforge.net/projects/xvidcap/). Unfortunately I cannot come up with a way for [wget](http://www.gnu.org/software/wget/) retrieval of the sourceball, so some manual labour is needed. Retrieve the sourceball and put it in /tmp. Then follow the instructions below. Also see [the snippet for an alias for the make command](http://snippets.aktagon.com/snippets/195-Nifty-alias-for-the-make-command-to-create-an-optimal-amount-of-processes-depending-on-the-number-of-CPU-s-you-have) first.

Note that I put the binaries in /usr/local/stow/xvidcap because the package comes from outside package management. I then use xstow to manage the symlinks in /usr/local/bin.


```bash
sudo apt-get install libxml-parser-perl libxmu-dev libglade2-dev libgtk2.0-dev
cd /tmp
tar zxvf xvidcap*.tar.gz
cd xvidcap*
./configure --prefix /usr/local/stow/xvidcap
make
sudo make install
cd /usr/local/stow
sudo xstow xvidcap
```
    

To remove xvidcap follow these steps


```bash
cd /usr/local/xstow
xstow -D xvidcap
sudo rm -rf /usr/local/stow/xvidcap
```
    

