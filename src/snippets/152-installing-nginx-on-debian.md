---
id: '152'
title: Installing nginx on Debian
languages:
- bash
tags:
---
DRAFT...

Find latest version of nginx

http://sysoev.ru/en/
http://wiki.codemongers.com/NginxInstallOptions

Install a compiler otherwise:
./configure: error: C compiler gcc is not found

The command:


```bash
sudo apt-get install build-essential
```
    

Install pre-requisites otherwise you'll get:

Configuration summary
+ threads are not used
+ PCRE library is not found
+ OpenSSL library is not found
+ md5 library is not used
+ sha1 library is not used
+ zlib library is not found

The command:


```bash
sudo apt-get install libpcre3 libpcre3-dev libpcrecpp0 libssl-dev zlib1g-dev
```
    

Much better:

Configuration summary
+ threads are not used
+ using system PCRE library
+ using system OpenSSL library
+ md5 library is not used
+ sha1 library is not used
+ using system zlib library

Compile and install nginx


```bash
$ ./configure \
        --sbin-path=/usr/local/sbin \
        --conf-path=/etc/nginx/nginx.conf \
        --pid-path=/var/run/nginx.pid \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --with-http_ssl_module \
        --http-client-body-temp-path=/tmp/nginx_client \
        --http-proxy-temp-path=/tmp/nginx_proxy \
        --http-fastcgi-temp-path=/tmp/nginx_fastcgi
$ make
$ sudo make install
```
    

Run the install script


```bash
cd /usr/local/src

wget http://sysoev.ru/nginx/nginx-0.5.35.tar.gz

tar zxvf nginx-0.5.35

cd nginx-0.5.35
```
    

Create an nginx user and group


```bash
$ useradd -g www-data -d /var/www nginx
```
    

Create the web server directory


```bash
mkdir /var/www
chown root.www-data /var/www
chmod ug=rwx,o= /var/www
```
    

Test configuration


```bash
nginx -t
2008/03/09 20:51:05 [info] 5034#0: the configuration file /etc/nginx/nginx.conf syntax is ok
2008/03/09 20:51:05 [info] 5034#0: the configuration file /etc/nginx/nginx.conf was tested successfully
```
    

Start nginx


```bash
nginx
```
    

