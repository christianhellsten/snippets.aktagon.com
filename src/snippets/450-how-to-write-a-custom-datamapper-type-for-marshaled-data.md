---
id: '450'
title: How to write a custom DataMapper type for marshaled data
languages:
- ruby
tags:
---
This is an example of how to write a custom data type for Ruby's DataMapper. We're going to write something similar to DataMapper::Property::Object

DataMapper &gt;= 1.0
--------------------

This code is for DataMapper version 1.0 and later where the DataMapper type concept has been merged with properties:


```ruby
module DataMapper
  class Property
    class Marshal < Object
      primitive ::Object
      def load(value)
        ::Marshal.load(value) if value
      end

      def dump(value)
        ::Marshal.dump(value) if value
      end
    end
  end
end
```
    

DataMapper &lt; 1.0
-------------------


```ruby
require 'dm-core'

module DataMapper
  module Types
    class Marshal < DataMapper::Type
      primitive Text

      def self.load(value, property)
        ::Marshal.load(value) if value
      end

      def self.dump(value, property)
        ::Marshal.dump(value) if value
      end
    end 
  end 
end
```
    

Next declare your field:


```ruby
property :properties, Marshal
```
    

Which is the same as **property :properties, Object** in this case.

