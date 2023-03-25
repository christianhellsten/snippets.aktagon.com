---
id: '725'
title: How to pass a Hash as a parameter to a Cucumber/Capybara step/test
languages:
- ruby
tags:
---
Helper:


```ruby
Given(/^I receive a message from "(.*?)" with data$/) do |from, table|
  # Convert AST table into hash
  data = table.raw.transpose.to_h # ".with_indifferent_access" if needed
  # Do something with the data
end
```
    

Test:


```ruby
And I receive a message from "jebus@hell.com" with data
  | first_name | last_name | status | price |
  | Jebus | Hell | broken | 4€ |
```
    

