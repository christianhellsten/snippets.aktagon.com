---
id: '247'
title: Logging nginx to remote loghost with syslog-ng.
languages:
- bash
tags:
- ansible
- '"ip address"'
- network
---
Nginx does not support syslog by default, so you have to patch it with a third party module. This snippet relies on that you have configured xstow. See [this](http://snippets.aktagon.com/snippets/188-Installing-git-without-getting-screwed-over-when-it-s-time-to-uninstall-upgrade-or-install-package-maintainer-s-version) snippet for instructions on xstow configuration.


```bash
cd /tmp
wget http://sysoev.ru/nginx/nginx-0.6.32.tar.gz
tar zxvf nginx-0.6.32.tar.gz
mv nginx-0.6.32 src-0.6.32-orig
wget "http://wiki.codemongers.com/NginxModules?action=AttachFile&do=get&target=syslog.patch" -O syslog.patch
patch -p0 < syslog.patch
cd src-0.6.32-orig
./configure --prefix=/usr/local/stow/nginx --with-syslog
make
sudo make install
cd /usr/local/stow
sudo xstow nginx
```
    

I-am-a-noob-at-syslog-disclaimer: This might be a totally wrong way to configure the server and client(s), so it is subject for refinement. In my experience it works though.

Configuring the **client**. Add the following lines to the end of /etc/syslog-ng/syslog-ng.conf and restart syslog-ng with /etc/init.d/syslog-ng restart. Nginx logs in facility local5 and the hostname of the loghost is "loghost". You could just as well use the IP of the loghost.


```bash
filter f_local5 { facility(local5); };
destination d_loghost {tcp("loghost" port(514));};
log { source(s_all); filter(f_local5); destination(d_loghost); };
```
    

Configuring the **server**. Add the following lines to the end of /etc/syslog-ng/syslog-ng.conf and restart syslog-ng with /etc/init.d/syslog-ng restart. Also if you run a cluster of nginx servers it might be wise to put all the output in one file, instead of separate files per host.


```bash
source s_remote { tcp(); };
destination d_clients { file("/var/log/HOSTS/nginx.$HOST"); };
log { source(s_remote); destination(d_clients); };
```
    

Test the logging by running this from the client.


```bash
logger -p local5.info Hubbabubba
```
    

