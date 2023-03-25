---
id: '69'
title: Creating a local Debian mirror for your Xen servers
languages:
- bash
tags:
- capybara
- cucumber
---
Once you've bought a dual or quad Xeon and started to experiment with virtualization you will soon want to create your local mirror to make installs lightning fast. This is a step-by-step how i did it.

First create the Xen that will be our mirror server. The size requirements can be found here: [Debian mirror sizes](http://www.debian.org/mirror/size) The combined size of amd64 architecture and architecture independent files was 39Gb on 1.9.2007. So I made the image 50Gb big. Remember to change this mirror to a location near you.


```bash
xen-create-image --hostname=mirrors.aktagon.com \
--size=50Gb --swap=256Mb --ip=10.0.0.44 \
--netmask=255.255.255.0 --gateway=10.0.0.2 \
--force --dir=/work/vserver --memory=256Mb \
--arch=amd64 \
--kernel=/boot/vmlinuz-2.6.18-5-xen-amd64 \
--debootstrap --dist=etch \
--mirror= http://ftp.fi.debian.org/debian/\
--passwd
```
    

Then ssh into your new Xen as root.


```bash
ssh -l root mirrors.aktagon.com
```
    

Make base configurations for a fresh Xen.


```bash
apt-get update && apt-get install locales console-data && dpkg-reconfigure locales
```
    

Then get the mirror synchronization script from Debian.


```bash
wget "http://www.debian.org/mirror/anonftpsync"
chmod a+x anonftpsync
```
    

Then install dependencies for anonftpsync script. Otherwise the script will fail with a <i>-bash: lockfile: command not found</i> error.


```bash
apt-get install procmail
```
    

Install nginx.


```bash
apt-get install nginx
```
    

Configure anonftpsync with your favorite editor and change the lines below. These settings will setup a mirror *only* for amd64 files. You could remove i386 from the excluded architectures, but then a 50Gb image won't fit all the files.


```bash
TO=/var/www/debian
RSYNC_HOST=ftp.fi.debian.org
RSYNC_DIR=debian
LOGDIR=/var/log/mirroring
ARCH_EXCLUDE="alpha arm hppa hurd-i386 i386 ia64 m68k mipsel mips powerpc s390 sh sparc source"
```
    

Make the log directory.


```bash
mkdir -p /var/log/mirroring
```
    

Configure nginx by modifying /etc/nginx/nginx.conf with your favorite editor. Just add the autoindex line into server { location / { context


```bash
# abbreviated start of file for clarity...
    server {
        listen       80;
        server_name  localhost;

        access_log  /var/log/nginx/localhost.access.log;

        location / {
            root   /var/www;
            # add the line below to allow directory listing
            autoindex  on;
            index  index.html index.htm;
        }
   # abbreviated end of file for clarity...
```
    

Do the synchronizing. And wait... for a long while. On a 8/1Mbit cable the first synchronize took roughly 20 hours.


```bash
./anonftpsync
```
    

Now modify your /etc/apt/sources.list on existing Xen images to use your local mirror. And remember to create new Xen images using your new mirror :) In the above case the URL is http://mirrors.aktagon.com/debian

NB: there is no public mirrors.aktagon.com available... sorry.

