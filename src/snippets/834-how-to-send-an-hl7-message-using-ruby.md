---
id: '834'
title: How to send an HL7 message using Ruby
languages:
- ruby
tags:
---
```ruby
require 'socket'
a = TCPSocket.new('127.0.0.1', 2575)
message = File.read("src/test/resources/iso-8859-1.hl7")
puts "Wrote:\n#{message}"
a.write "\x0b#{message}\x1c\r"
puts "Received:\n" + a.recv(1024)
a.close
```
