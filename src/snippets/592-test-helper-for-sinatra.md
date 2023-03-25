---
id: '592'
title: Test helper for Sinatra
languages:
- ruby
tags:
---
Shows how to:
\* Setup session
\* Sign in users
\* Prevent http traffic with FakeWeb
\* Keep the database clean with DatabaseCleaner
\* Use FactoryGirl factories
\* Stub methods
\* Use functional tests with Rack::Test and Webrat
\* Set HTTP headers

test/test\_helper.rb:


```ruby
require "rack/test"
require 'faker'
require 'fakeweb'
require 'mocha'
require "webrat"
require "test/unit"
require "factory_girl"
require "database_cleaner"
require "minitest/mock"
require 'minitest/spec'
require "minitest/pride"

ENV['RACK_ENV'] = 'test'

require_relative '../app'
require_relative 'factories'

FakeWeb.allow_net_connect = false

Webrat.configure do |config|
  config.mode = :rack
end

DatabaseCleaner.strategy = :truncation

class FunctionalTest < Test::Unit::TestCase
  include Rack::Test::Methods
  include Webrat::Matchers
  include Webrat::Methods
  
  # Automate stuff  
  def app
    self.class.name.sub(/Test$/, '').constantize
  end

  def setup
    DatabaseCleaner.start
    super
  end

  def teardown
    DatabaseCleaner.clean
    super
  end

  # Setup session before test.
  #
  # From https://gist.github.com/1118304
  def setup_session(data = {})
    sid = SecureRandom.hex(32)
    hsh = data.merge("session_id" => sid)
    data = [Marshal.dump(hsh)].pack('m')
    secret = app.session_secret
    hmac = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, secret, data)
    str = "#{data}--#{hmac}"
    set_cookie("rack.session=#{URI.encode_www_form_component(str)}")
  end

  def sign_in(options = {})
    @user = FactoryGirl.create(:user)
    User.stubs(:find).returns(@user)
    setup_session user_id: @user.id
    # Set an HTTP header
    #current_session.header key.to_s, value
  end
end

class MiniTest::Spec
  before :each do
    DatabaseCleaner.start
  end
  after :each do
    DatabaseCleaner.clean
  end
end
```
    

And here's an example of a test:


```ruby
require_relative './test_helper'

class UsersControllerTest < FunctionalTest
  # Not needed see test_helper.rb
  def app
    # Don't f**ing write UsersController.new or you will get weird errors if you try to touch your app's private parts
    UsersController
  end
  def setup
    sign_in
  end
  def test_something
    params = { user: { email: 'jebuslocalhost', password: 'jebus', password_confirmation: 'jebus' } }
    post '/new', params
    assert_have_selector '.error-message'
    assert last_response.ok?
  end
end
```
    

Guardfile:


```ruby
# More info at https://github.com/guard/guard#readme
guard 'bundler'
guard 'minitest' do
  # Specs
  watch(%r|^spec/(.*)_spec\.rb|)
  watch(%r|^spec/spec_helper\.rb|)    { "spec" }

  # Code
  watch(%r|^app/(.*)\.rb|)      { |m| "spec/app/#{m[1]}_spec.rb" }
  watch(%r|^lib/(.*)\.rb|)      { |m| "spec/lib/#{m[1]}_spec.rb" }
end
```
    

