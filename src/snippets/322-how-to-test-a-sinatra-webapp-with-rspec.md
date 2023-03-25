---
id: '322'
title: How to test a Sinatra webapp with Rspec
languages:
- ruby
tags:
---
Create spec/app\_spec.rb and put the following in it:


```ruby
require 'sinatra'
require 'spec/interop/test'
require 'sinatra/test/unit'

require 'app'
require 'test/spec'

set :environment, :test

describe 'The HelloWorld App' do
  before(:each) do
    set :views => File.join(File.dirname(__FILE__), "..", "views")
  end

  it "says hello" do
    get '/'
    response.should.be.ok
    response.body.should.equal 'Hello World'
  end
end
```
    

Then run the test:


```ruby
spec spec/app_spec.rb
```
    

