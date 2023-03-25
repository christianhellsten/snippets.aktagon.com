---
id: '154'
title: Installing Rails, mongrel and mongrel_cluster on Debian
languages:
- bash
tags:
---
DRAFT...

Install RubyGems


```bash
http://rubyforge.org/frs/download.php/29548/rubygems-1.0.1.tgz

tar zxvf rubygems-1.0.1.tgz

cd rubygems-1.0.1

ruby setup.rb
```
    

Install Rails


```bash
gem install rails
```
    

Install sqlite3 (optional)


```bash
apt-get install sqlite3 libsqlite3-dev
gem install sqlite3-ruby
```
    

Install mongrel and mongrel\_cluster


```bash
$ gem install mongrel mongrel_cluster

$ mongrel_rails cluster::configure -e production \
  -p 8000 \
  -a 127.0.0.1 \
  -N 3 \
  -c /var/www/xyz/current


$ mongrel_rails cluster::start


$ useradd -g www-data -d /var/www mongrel
```
    

Surviving reboots


```bash
sudo mkdir /etc/mongrel_cluster

sudo ln -s /var/www/xyz/config/mongrel_cluster.yml /etc/mongrel_cluster/xyz.yml

sudo cp /usr/local/lib/ruby/gems/1.8/gems/mongrel_cluster-1.0.5/resources/mongrel_cluster /etc/init.d/

sudo chmod +x /etc/init.d/mongrel_cluster

sudo /usr/sbin/update-rc.d -f mongrel_cluster defaults

mongrel_cluster_ctl status
```
    

Stale pids
----------

If your mongrels crash or if you kill them, mongrel\_cluster won't start your mongrels because mongrel\_cluster believes the processes are still running, instead mongrel\_cluster complains and does nothing:


```bash
** !!! PID file tmp/pids/mongrel.8000.pid already exists.  Mongrel could be running already.  Check your log/mongrel.8000.log for errors.
** !!! Exiting with error.  You must stop mongrel and clear the .pid before I'll attempt a start.
```
    

To fix this simply add the **--clean** switch to the /usr/local/lib/ruby/gems/1.8/gems/mongrel\_cluster-1.0.5/resources/mongrel\_cluster startup script:


```bash
mongrel_cluster_ctl start -c $CONF_DIR --clean
```
    

