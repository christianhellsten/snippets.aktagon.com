---
id: '227'
title: Installing ImageMagick from sources and using xstow to handle the installation.
languages:
- bash
tags:
- access
- analytics
- goaccess
- log
---
I really hate installing software outside of the package manager, because that is not the way of a stable system. Xstow helps the agony those times that sourceball installations are necessary (e.g for new features). Here's how to install imagemagick with xstow. If you haven't installed xstow yet, then follow the relevant instructions in [this snippet](http://snippets.aktagon.com/snippets/188-Installing-git-without-getting-screwed-over-when-it-s-time-to-uninstall-upgrade-or-install-package-maintainer-s-version)


```bash
sudo apt-get install libmagick9-dev # needed for sane image support
cd /tmp
wget ftp://ftp.sunet.se/pub/multimedia/graphics/ImageMagick/ImageMagick-6.4.2-7.tar.bz2
tar xjvf ImageMagick-6.4.2-7.tar.bz2
sudo mv ImageMagick-6.4.2 /usr/src
cd /usr/src
sudo ln -s ImageMagick-6.4.2 imagemagick
cd imagemagick
./configure --prefix=/usr/local/stow/imagemagick
make
sudo make install
cd /usr/local/stow
sudo xstow imagemagick
```
    

