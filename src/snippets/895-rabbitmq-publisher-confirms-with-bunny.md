---
id: '895'
title: RabbitMQ Publisher Confirms with Bunny
languages:
- ruby
tags:
---
Source https://github.com/ruby-amqp/bunny/blob/master/examples/guides/extensions/publisher_confirms.rb:

```ruby
require "bunny"

puts "=> Demonstrating publisher confirms"
puts

conn = Bunny.new
conn.start

ch   = conn.create_channel
x    = ch.fanout("amq.fanout")
q    = ch.queue("", :exclusive => true).bind(x)

ch.confirm_select
1000.times do
  x.publish("")
end
ch.wait_for_confirms # blocks calling thread until all acks are received

sleep 0.2
puts "Received acks for all published messages. #{q.name} now has #{q.message_count} messages."

sleep 0.7
puts "Disconnecting..."
conn.close
```
