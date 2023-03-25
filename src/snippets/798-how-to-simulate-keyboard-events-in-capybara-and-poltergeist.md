---
id: '798'
title: How to simulate keyboard events in Capybara and Poltergeist
languages:
- ruby
tags:
---
```ruby
Then(/^when I press backspace in '(.*?)'$/) do |input|
  focus_field(input)
  find_field(input).native.send_keys(:Backspace)
end
```

Details:
https://github.com/teampoltergeist/poltergeist/blob/master/spec/integration/driver_spec.rb#L1203
