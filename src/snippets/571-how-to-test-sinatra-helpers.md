---
id: '571'
title: How to test Sinatra helpers
languages:
- ruby
tags:
---
This one depends on a request object (Rack::Request) being present:


```ruby
class AppHelpersSpec < Test::Unit::TestCase                                            
  include AppHelpers
  include Rack::Test::Methods

  def request
    Rack::Request.new(Rack::MockRequest.env_for '/', {params: {name: 'hohohoe'}})
  end

  def test_helper_method
    res = some_helper_method # call helper method
    assert_equal 'WTF!', res
  end
end
```
    

LOL.

