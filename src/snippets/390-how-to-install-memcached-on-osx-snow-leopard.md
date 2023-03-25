---
id: '390'
title: How to install memcached on OSX Snow Leopard
languages:
- bash
tags:
- rails
- ruby
- version
---
These instructions are from [wincent.com](https://wincent.com/wiki/Installing_memcached_1.4.1_on_Mac_OS_X_10.6_Snow_Leopard):


```bash
cd /usr/local/src
curl -O http://www.monkey.org/~provos/libevent-1.4.12-stable.tar.gz
tar xzvf libevent-1.4.12-stable.tar.gz 
cd libevent-1.4.12-stable
./configure
make
make verify
sudo make install


cd /usr/local/src
curl -O http://memcached.googlecode.com/files/memcached-1.4.1.tar.gz
tar xzvf memcached-1.4.1.tar.gz 
 cd memcached-1.4.1
./configure
make
make test
sudo make install

memcached -d -P pidfile -l 127.0.0.1
```
    

