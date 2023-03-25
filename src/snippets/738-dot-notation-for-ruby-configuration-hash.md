---
id: '738'
title: Dot notation for Ruby configuration hash
languages:
- ruby
tags:
---
Convert a normal hash into a hash that allows e.g. this:


```ruby
CONFIG['session.ttl'] => 60
CONFIG['session.tt'] => KeyError
```
    

Code:


```ruby
def to_namespace_hash(object, prefix = nil)
  if object.is_a? Hash
    object.map do |key, value|
      if prefix
        to_namespace_hash value, "#{prefix}.#{key}"
      else
        to_namespace_hash value, "#{key}"
      end
    end.reduce(&:merge)
  else
    { prefix => object }
  end
end

CONFIG = ... # Load hash from YAML/JSON/database/etc
CONFIG = to_namespace_hash(CONFIG).freeze

def CONFIG.[](key)
  fetch(key)
rescue KeyError => e
  possible_keys =keys.map { |x| x if x.match /.*?#{key}.*?/i }.delete_if(&:blank?).join("\n")
  fail KeyError, "Key '#{key}' not found. Did you mean one of:\n#{possible_keys}"
end
```
    

