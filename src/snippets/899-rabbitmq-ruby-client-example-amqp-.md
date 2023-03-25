---
id: '899'
title: RabbitMQ Ruby client example (AMQP)
languages:
- ruby
tags:
---
```ruby
require 'bunny'

# See http://rubybunny.info/articles/concurrency.html
class AMQP
  # Bunny::Session
  def self.session
    Thread.current[:bunny_session] ||= Bunny.new(uri).start
  end
  class << self
    alias connect session
  end

  # Bunny::Channel
  def self.channel
    Thread.current[:bunny_channel] ||= session.create_channel
  end

  # Bunny::Exchange
  def self.exchange
    channel.topic(EXCHANGE, auto_delete: false, durable: true)
  end

  def self.publish(message, queue:)
    exchange.publish(message, routing_key: queue)
  end

  def self.disconnect
    session&.close
  end

  # amqp://user:pass@localhost:5672
  def self.uri
    ENV.fetch('AMQP_URI')
  end
end
```

- All Bunny methods are not thread safe, e.g., channel
- Call AMQP.connect/disconnect in Puma/Unicorn/Sneakers/Sidekiq's after/before_fork callbacks.
