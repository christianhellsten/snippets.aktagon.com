---
id: '645'
title: Integration Tests With Capybara, Devise, Minitest::Spec, and Capybara-Webkit
languages:
- ruby
tags:
---
Does your boss want you to run integration tests with Capybara, Devise, Minitest::Spec, Capybara-Webkit, and the Headless gem?

Then use this code, which features:
\* Automatic test failure on JavaScript errors
\* Check for XSS attack vectors with assert\_no\_alerts.
\* Sign in/out with Devise


```ruby
require 'headless'
require 'awesome_print'

headless = Headless.new(reuse: true, destroy_at_exit: false)
puts "Headless mode. Display :#{headless.display}. PID #{Process.pid}"
headless.start

class IntegrationSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    assert_no_js_errors
  end

  after do
    Warden.test_reset!
  end

  def sign_in(user, scope = :user)
    login_as(user, scope: scope)
  end

  def sign_out(scope = :user)
    logout(scope)
  end

  def assert_no_js_errors
    errors = page.driver.error_messages
    assert_equal 0, errors.size, errors.ai
  end

  def assert_no_alerts(types = [:alert, :confirm, :prompt])
    types.each do |type|
      alerts = page.driver.send(:"#{type}_messages")
      assert_equal 0, alerts.size, alerts.ai
    end
  end

  def default_url_options
    Rails.configuration.action_mailer.default_url_options
  end
end

MiniTest::Spec.register_spec_type( /integration$/, IntegrationSpec )
```
    

Remember to name your tests like this:


```ruby
require 'test_helper'

describe "Dashboard integration" do
...
end
```
    

Otherwise the tests won't inherit from the IntegrationSpec class.

