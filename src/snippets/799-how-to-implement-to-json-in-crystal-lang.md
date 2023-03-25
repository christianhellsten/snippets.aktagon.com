---
id: '799'
title: How to implement to_json in Crystal lang
languages:
- crystal
tags:
---
Tested on version 0.19.4. This is an example of how to implement a generic to_json method in Crystal lang:

```crystal
class Document
  def initialize
    @name = "xyz"
    ...
  end
  
  # Returns an array containing all instance variables. Implemented with a macro.
  def instance_vars
    {{
      @type.instance_vars.map do |var|
        [ var.name.stringify, var.id ]
      end
    }}
  end

  # Returns a JSON string containing all instance variables
  def to_json
    result = String.build do |io|
      JSON::PrettyWriter.new(io, indent: "  ").json_object do |object|
        instance_vars.each do |var|
          name, value = var
          case value
          when XML::Node
            # skip
          else
            object.field name, value
          end
        end
      end
    end
  end
```
