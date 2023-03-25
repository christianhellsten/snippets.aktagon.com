---
id: '662'
title: Make a nested OpenStruct from a Hash in Ruby
languages:
- ruby
tags:
---
```ruby
class NestedOstruct < OpenStruct
  MAPPING = {
    Hash => ->(s) { new(s) },
    Array => ->(s) { s.collect { |i| i.is_a?(Hash) ? new(i) : i } }
  }.freeze

  def initialize(hash)
    super
    hash.each do |k, v|
      self[k] = (MAPPING[v.class] || ->(s) { s })[v]
    end
  end

  def method_missing(meth, *args)
    raise NoMethodError, meth unless meth.to_s.end_with?('=')

    super
  end

  def respond_to_missing?(_method_name, _include_private = false)
    super
  end
end
```

There's also the Hashie gem https://github.com/hashie/hashie, but some people consider it "harmful":
https://www.schneems.com/2014/12/15/hashie-considered-harmful.html
