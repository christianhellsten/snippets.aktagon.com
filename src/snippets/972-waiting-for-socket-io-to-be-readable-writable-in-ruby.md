---
id: '972'
title: Waiting for Socket (IO) to be readable / writable in Ruby
languages:
- ruby
tags:
---
Option 1: Use IO.select

Use IO.select with read_nonblock, write_nonblock, and connect_nonblock.

Option 2: Use io-wait

- https://github.com/ruby/io-wait:

- https://github.com/ruby/io-wait/blob/master/test/io/wait/test_io_wait.rb


```ruby
require 'io/wait'
r, w = IO.pipe
w.wait_writable(0.1)
```

Example from https://bugs.ruby-lang.org/issues/12013?tab=history:

```ruby
# 30 second wait
IO.select([mysock],[mysock], nil, 30)
# as opposed to (60 second wait)
require 'io/wait'
mysock.wait_readable(30) && mysock.wait_writable(30)
```

