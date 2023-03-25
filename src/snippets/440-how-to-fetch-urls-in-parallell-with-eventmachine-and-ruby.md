---
id: '440'
title: How to fetch URLs in parallell with EventMachine and Ruby
languages:
- ruby
tags:
---
Save time by doing things in parallell:


```ruby
require 'rubygems'
require 'eventmachine'
require 'open-uri'
require 'pp'
require 'thread'
require 'benchmark'

class Worker
  include EM::Deferrable

  def run
    get_google
    set_deferred_status :succeeded
  end
end

def get_google
  # sorry for spamming you
  open('http://www.google.com/') do |f|
    #pp f.meta
  end
end

def asynchronous(i)
  worker = Worker.new
  # on success
  worker.callback do
    p "#{Thread.current} done #{i}!"
  end 
  worker.errback do 
    p "Unexpected error"    
    EM.stop  
  end
  #
  Thread.new do
    worker.run
    EM.stop
  end 
  #puts "scheduling done!"
end

def synchronous(i)
  get_google
end

# on error
EM.error_handler do |e|  
  p "Unexpected error: #{e}" 
end

EM.run do
  seconds = Benchmark.realtime do
    50.times do |i|
      asynchronous i
    end
  end
  p "With EventMachine: #{seconds} elapsed..."

  seconds = Benchmark.realtime do
    50.times do |i|
      synchronous i
    end
  end
  p "Without EventMachine: #{seconds} elapsed..."
end
```
    

Output:


```ruby
With EventMachine: 9.05974316596985 elapsed...
Without EventMachine: 19.1381118297577 elapsed...
```
    

Conclusion
----------

\* Speeds up blocking operations.
\* EventMachine is currently limited to one CPU core (native thread) per process.

References
\* <http://ujihisa.blogspot.com/2009/08/try-eventmachine.html>
\* <http://www.scribd.com/doc/21017871/Event-Machine-Presentation>
\* <http://www.scribd.com/doc/25939580/Event-Machine>
------------------------------------------------------------------

