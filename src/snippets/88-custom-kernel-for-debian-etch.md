---
id: '88'
title: Custom kernel for Debian Etch
languages:
- bash
tags:
---
Sometimes you just need a kernel that is newer than the package manager has to offer. For me it was the bug fixes for the driver of the sound card in x61s. Here's how to do it "the debian way".


```bash
wget http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.23.1.tar.bz2
tar xjvf linux-2.6.23.1.tar.bz2 -C /usr/src
rm /usr/src/linux && ln -s /usr/src/linux-2.6.23.1 /usr/src/linux
cd /usr/src/linux
zcat /proc/config.gz > .config
make xconfig
```
    

Now turn on and configure the new features you are looking for in the new kernel, save the configuration and finally quit.


```bash
make-kpkg clean
fakeroot make-kpkg --initrd --append-to-version=-custom-13.10.2007 kernel_image kernel_headers
cd ..
sudo dpkg -i linux-image-2.6.23.1-custom-13.10.2007_2.6.23.1-custom-13.10.2007-10.00.Custom_amd64.deb
sudo dpkg -i linux-headers-2.6.23.1-custom-13.10.2007_2.6.23.1-custom-13.10.2007-10.00.Custom_amd64.deb
```
    

The --append-to-version parameter appends the given value into the kernel signature, so that it is easily recognized. If you compile a kernel with the exactly same name as a previous kernel you have then you must move away the directory /lib/modules/your-kernel-name-here.

