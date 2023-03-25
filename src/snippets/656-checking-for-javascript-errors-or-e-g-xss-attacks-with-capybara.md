---
id: '656'
title: Checking For JavaScript Errors or e.g. XSS Attacks With Capybara
languages:
- ruby
tags:
---
Use the following code to check for JavaScript errors, or XSS vulnerabilities:


```ruby
class IntegrationSpec < MiniTest::Spec
  def assert_no_js_errors
    assert_equal 0, page.driver.error_messages.size, page.driver.error_messages.ai
  end

  def assert_no_alerts(types = [:alert, :confirm, :prompt])
    types.each do |type|
      alerts = page.driver.send(:"#{type}_messages")
      assert_equal 0, alerts.size, alerts.ai
    end
  end
end
```
    

Test plan
\* Insert XSS hacks into database
\* Write integration tests that visit all pages

Requires
\* capybara
\* capybara-webkit

