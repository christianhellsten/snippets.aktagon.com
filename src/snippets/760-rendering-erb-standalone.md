---
id: '760'
title: Rendering ERB standalone
languages:
- ruby
tags:
---
How to Render ERB standalone

## Basic example

```ruby
require 'erb'
msg = "world"
puts ERB.new("hello #{msg}").result(binding)
=> hello world
```

## Advanced example

```ruby
#
# Renders an ERB template.
#
# Example:
#
#  assert_equal "world", Utils::ERB.render(
#    template: "<%= hello %>",
#    locals: { hello: "world"}
#  )
#
def self.render(template:, locals:)
  locals = Struct.new(*locals.keys).new(*locals.values) if locals.is_a?(Hash)
  # dash => trim whitespaces, e.g., <% if x = y -%>
  ::ERB.new(template, nil, '-').result(locals.instance_eval { binding })
rescue Exception => e
  message = "#{e.class}: #{e} "
  line = e.backtrace.grep(/^\(erb\)/)[0]
  if line
    line_no = line.split(':')[1].to_i
    message += "while evaluating line #{line_no}:\n"
    message += template.split("\n")[line_no-1]
    message += "\nBacktrace: " + e.backtrace.join("\n")
    raise e.class, message
  end
  raise e
end
```
