---
id: '648'
title: MiniTest with Deferred Garbage Collection
languages:
- ruby
tags:
---

```ruby
class DeferredGarbageCollection
  DEFERRED_GC_THRESHOLD = (ENV['DEFER_GC'] || 10.0).to_f

  @last_gc_run = Time.now

  def self.start
    GC.disable if DEFERRED_GC_THRESHOLD > 0
  end

  def self.reconsider
    if DEFERRED_GC_THRESHOLD > 0 && Time.now - @last_gc_run >= DEFERRED_GC_THRESHOLD
      GC.enable
      GC.start
      GC.disable
      @last_gc_run = Time.now
    end
  end
end

module MiniTestDeferredGC
  def before_setup
    DeferredGarbageCollection.start
    super
  end

  def after_teardown
    super
    DeferredGarbageCollection.reconsider
  end
end

class MiniTest::Test
  include MiniTestDeferredGC
end
```
    

