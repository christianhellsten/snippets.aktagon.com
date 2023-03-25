---
id: '153'
title: Compiling Ruby with OpenSSL, Zlib and Readline support on Debian
languages:
- ruby
tags:
---
DRAFT... From http://blog.fiveruns.com/2008/3/3/compiling-ruby-rubygems-and-rails-on-ubuntu

Install pre-requisites


```ruby
apt-get -y install build-essential libssl-dev libreadline5-dev zlib1g-dev
```
    

Download and install


```ruby
cd /usr/local/src

wget http://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6.tar.gz

tar zxvf ruby-1.8.6.tar.gz

cd ruby-1.8.6.tar.gz

./configure --prefix=/usr/local --with-openssl-dir=/usr --with-readline-dir=/usr --with-zlib-dir=/usr

make
make install

ruby -ropenssl -rzlib -rreadline -e "puts :success"
```
    

