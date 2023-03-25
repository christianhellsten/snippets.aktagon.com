---
id: '320'
title: How to install and use Redis with Ruby
languages:
- ruby
tags:
- bcrypt
- golang
---
[Redis](http://code.google.com/p/redis/) and [redis-rb](github.com/ezmobius/redis-rb) example:


```ruby
git clone git://github.com/ezmobius/redis-rb.git
cd redis-rb/
rake redis:install
rake dtach:install
rake redis:start &
rake install

cat <<EOF >>test.rb
require 'rubygems'
require 'redis'

r = Redis.new

r.delete('foo')

p'set foo to "bar"'
r['foo'] = 'bar'

p 'value of foo'
p r['foo']
EOF

ruby test.rb
```
    

If Redis is not started Ruby will exit at Redis.new for some reason without saying anything.

