---
id: '321'
title: How to install Tokyo Tyrant, Tokyo Cabinet and rufus-tokyo
languages:
- ruby
tags:
- hapi
- hl7
- java
- obx
- oru
---

```ruby
git clone git://github.com/etrepum/tokyo-cabinet.git
git clone git://github.com/etrepum/tokyo-tyrant.git


cd tokyo-cabinet/
./configure
make
sudo make install

cd ..

cd tokyo-tyrant/
./configure
make
sudo make install

ttserver -port 45001 data.tch

sudo gem install rufus-tokyo

cat <<EOF >>test.rb

require 'rubygems'
require 'rufus/tokyo/tyrant'
require 'benchmark'


#db = Rufus::Tokyo::Cabinet.new('data.tch')

db = Rufus::Tokyo::Tyrant.new('localhost', 45001)
 
 seconds = Benchmark.realtime do
  for i in 1..1000000
    db['nada' + i.to_s] = 'surf' + i.to_s
  end
end

puts seconds
db.close

EOF

ruby test.rb
```
    

Gotchas
-------

One gotcha I learned was that you should only use strings not symbols. If you use symbols you'll get this weird error:


```ruby
Invalid String value
```
    

Another gotcha is that Tokyo Cabinet will lock a database. If you try to open the same database from another process it will wait for the other process to close the database.

Debian
------

On Debian you need to install bzlib before installing tokyo-cabinet:


```ruby
apt-get install libbz2-dev
```
    

