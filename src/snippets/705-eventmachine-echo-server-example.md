---
id: '705'
title: Eventmachine Echo Server Example
languages:
- ruby
tags:
---

```ruby
require 'rubygems'
require 'eventmachine'
require 'logger'

#
# Each connection creates a new EchoServer.
#
module EchoServer
  LOG = Logger.new('echo.log')

  #
  # Called by the event loop immediately after the network connection has been
  # established, and before resumption of the network loop.
  #
  def post_init
    LOG.info "-- Connection established #{remote_ip} --"
  end

  #
  # Called by the event loop whenever data has been received by the network
  # connection. It is never called by user code.
  #
  def receive_data data
    message = "#{remote_ip}: #{data}"
    LOG.info message
    send_data message
    close_connection if data =~ /quit/i
  end

  #
  # Called by the framework whenever a connection (either a server or client
  # connection) is closed.
  #
  def unbind
    LOG.info "-- Connection closed #{remote_ip} --"
  end

  #
  # Return the IP and port of the remote client.
  #
  def remote_ip
    @remote_ip ||= begin
                     port, ip = Socket.unpack_sockaddr_in(get_peername)
                     "#{ip}:#{port}"
                   end
  end
end

EventMachine::run do
  Signal.trap("INT")  { EventMachine.stop }
  Signal.trap("TERM") { EventMachine.stop }
  EventMachine::start_server "0.0.0.0", 8080, EchoServer
end
```
    

Use telnet to test it:


```ruby
$ telnet localhost 8080
```
    

