---
id: '402'
title: How to install Nginx from source, Ruby Enterprise Edition, and Phusion Passenger
languages:
- bash
tags:
- bundler
- git
- github
- private
- repository
---
Ruby Enterprise Edition:


```bash
cd /usr/local/src
wget thttp://rubyforge.org/frs/download.php/66162/ruby-enterprise-1.8.7-2009.10.tar.gz
tar zxvf ruby-enterprise-1.8.7-2009.10.tar.gz
./ruby-enterprise-1.8.7-2009.10/installer

ln -fs /opt/ruby-enterprise-1.8.7-2009.10 /opt/ruby-enterprise/
```
    

Nginx:


```bash
wget -P http://sysoev.ru/nginx/nginx-0.7.63.tar.gz
tar -xzf nginx-0.7.63.tar.gz
```
    

Phusion Passenger:


```bash
gem install passenger
/opt/ruby-enterprise/bin/passenger-install-nginx-module --auto --nginx-source-dir=/tmp/nginx-0.7.63 --prefix=/opt/nginx --extra-configure-flags=--with-http_ssl_module
```
    

