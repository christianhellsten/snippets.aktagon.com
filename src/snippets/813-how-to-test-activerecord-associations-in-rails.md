---
id: '813'
title: How to test ActiveRecord associations in Rails
languages:
- ruby
tags:
---
spec_helper.rb

```ruby
def assert_association(model, name, type, options)
  reflection = model.reflect_on_association(name)
  assert reflection, "#{model} has no association named #{name}"
  assert_equal type, reflection.macro
  assert_equal options.sort, reflection.options.sort
end
```

```ruby
require 'spec_helper'

describe Order do
  it "has associations" do
    assert_association Order, :organization, :belongs_to, {}
    assert_association Order, :items, :has_many, class_name: Order::Item
  end
end
```
