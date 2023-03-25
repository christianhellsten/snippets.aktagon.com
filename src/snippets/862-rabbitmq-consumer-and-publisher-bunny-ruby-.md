---
id: '862'
title: RabbitMQ consumer and publisher (Bunny/Ruby)
languages:
- bash
- ruby
tags:
---
Create consumer.rb:

```ruby
require 'bunny'
bunny = Bunny.new(ENV.fetch('AMQP_URL'))
bunny.start
at_exit { bunny.stop }
channel = bunny.create_channel
channel.prefetch(1)
exchange = channel.topic(ENV.fetch('EXCHANGE'), durable: true, passive: true)
queue = channel.queue(ENV.fetch('QUEUE'), durable: true, passive: true)
queue.bind(exchange)
queue.subscribe(manual_ack: true, block: true) do |delivery_info, _metadata, payload|
  puts "==============="
  puts payload
  puts "==============="
  channel.acknowledge(delivery_info.delivery_tag, false)
end
```

Start consumer:

```bash
$ EXCHANGE=cnn QUEUE=news AMQP_URL=amqp://username:password@localhost:5672 ruby consumer.rb
```
 
Create publisher.rb:

```ruby
require "bunny"

class Publisher
  def self.initialize(amqp_url, exchange:)
    @@bunny = Bunny.new(amqp_url)
    @@bunny.start
    @@channel = @@bunny.create_channel
    # 'passive = true' means exchange already exists
    @@exchange = @@bunny.channel.topic(exchange, passive: true)
    at_exit { @@bunny.stop }
  end

  def self.send(message, queue:)
    @@exchange.publish(message, routing_key: queue)
  end
end

queue = ENV.fetch('QUEUE')
Publisher.initialize(ENV.fetch('AMQP_URL'), exchange: ENV.fetch('EXCHANGE'))
Publisher.send('Ruby is the best programming language', queue: queue)
Publisher.send('Top 10 silver-bullet solutions in Java', queue: queue)
```

Start publisher.rb:

```bash
$ EXCHANGE=cnn QUEUE=news AMQP_URL=amqp://username:password@localhost:5672 ruby publisher.rb
```
