---
id: '180'
title: How to install and use the Sphinx search engine and acts_as_sphinx plugin on
  Debian Etch
languages:
- bash
tags:
---
Inspiration for this snippet was taken from [this post](http://www.sphinxsearch.com/forum/view.html?id=1419) on the Sphinx forum, plus [this blog post](http://www.datanoise.com/articles/2007/3/23/acts_as_sphinx-plugin).

Compiling Sphinx
----------------

First install the prerequisites:


```bash
sudo aptitude install libmysql++-dev libmysqlclient15-dev checkinstall
```
    

Next download sphinx, libstemmer and install everything and the fish:


```bash
cd /usr/local/src

wget http://sphinxsearch.com/downloads/sphinx-0.9.9.tar.gz
tar zxvf sphinx-0.9.9.tar.gz 

cd sphinx-0.9.9/

# Add stemming support for Swedish, Finnish and other fun languages.
wget http://snowball.tartarus.org/dist/libstemmer_c.tgz
tar zxvf libstemmer_c.tgz

./configure --with-libstemmer
make

make install
```
    

Configure Sphinx
----------------

Create a sphinx.conf file in your Rails config directory, as described [here](http://www.datanoise.com/articles/2007/3/23/acts_as_sphinx-plugin), or use [this template](http://snippets.aktagon.com/snippets/181-Sphinx-template-configuration-file).

Install acts\_as\_sphinx plugin
-------------------------------


```bash
./script/plugin install http://svn.datanoise.com/acts_as_sphinx
```
    

Add acts\_as\_sphinx to your model:


```bash
class Documents
   acts_as_sphinx
end
```
    

Indexing content
----------------


```bash
rake sphinx:index

(in /var/www/xxx.com/releases/20080429144230)
Sphinx 0.9.8-rc2 (r1234)
Copyright (c) 2001-2008, Andrew Aksyonoff

using config file './sphinx.conf'...
indexing index 'xxx.com'...
collected 5077 docs, 0.6 MB
sorted 0.1 Mhits, 100.0% done
total 5077 docs, 632096 bytes
total 0.160 sec, 3950427.25 bytes/sec, 31729.86 docs/sec
```
    

Reindexing content
------------------

sphinx:index shouldn't be run while the searchd process is running, so use rake sphinx:rotate instead, which restarts the searchd process after indexing.

Starting the daemon
-------------------


```bash
mkdir -m 664 /var/log/sphinx
rake sphinx:start

(in /var/www/xxx.com/releases/20080429144230)
Sphinx 0.9.8-rc2 (r1234)
Copyright (c) 2001-2008, Andrew Aksyonoff

using config file './sphinx.conf'...
Sphinx searchd server started.
```
    

Searching
---------


```bash
Documents.find_with_sphinx 'why did I write this'
```
    

