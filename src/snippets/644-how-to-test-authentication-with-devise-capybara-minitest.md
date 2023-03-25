---
id: '644'
title: How to Test Authentication With Devise+Capybara+Minitest
languages:
- ruby
tags:
---
Testing authentication functionality with Capybara and Devise? See the following checklist:

\* [Use shared connections](https://gist.github.com/josevalim/470808) or disable transactional fixtures.
\* Set Capybara.default\_host to match config.session\_store.domain or you'll get "401 Unauthorized"
\* Name of test should end with "integration", e.g. describe "Dashboard Business **integration**" do
\* Add the following to your integration tests:


```ruby
include Warden::Test::Helpers
  Warden.test_mode!

  after do
    Warden.test_reset!
  end
```
    

Full example of integration test with Devise, Capybara, and minitest:


```ruby
class IntegrationSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @routes = Rails.application.routes
  end

  after do
    Warden.test_reset!
  end

  def sign_in(user)
    login_as(user, scope: :user)
  end

  def sign_out
    logout(:user)
  end

  def default_url_options
    Rails.configuration.action_mailer.default_url_options
  end
end

MiniTest::Spec.register_spec_type( /integration$/, IntegrationSpec )
```
    

