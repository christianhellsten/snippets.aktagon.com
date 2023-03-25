---
id: '649'
title: Timing and Benchmarking Minitest Tests
languages:
- ruby
tags:
---
Put this in test/support/timing.rb:


```ruby
module MiniTestTiming
  class << self; attr_accessor :failure_threshold end

  def before_setup
    @start_time = Time.now
    super
  end

  def after_teardown
    super
    end_time = Time.now
    duration = (end_time - @start_time).seconds.round(1)
    time = duration.to_s + "s"
    name = "#{self.class.name}.#{__name__}"
    limit = MiniTestTiming.failure_threshold
    File.open 'log/test_duration.log', 'a' do |f|
      f << "#{time.ljust(5)}: #{name}\n"
    end
    assert duration < limit, "#{name} took too long (#{time} > #{limit}s)"
  end
end

# Set threshold for failing tests to 1 second
MiniTestTiming.failure_threshold = 1

class MiniTest::Test
  include MiniTestTiming
end
```
    

The time it takes your tests will show up in log/test\_duration.log.

You can also output the time it took to run a test by using the verbose switch:


```ruby
rake test TESTOPTS="--verbose"
```
    

