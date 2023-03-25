---
id: '139'
title: Dynamic RSpec tests using plain old Ruby
languages:
- ruby
tags:
---
Just happened to stumble upon the following article at caboo.se: [Handy dynamic rspec tip](http://www.caboo.se/articles/2008/1/21/handy-dynamic-rspec-tip#comments).

I immediately found a way of simplifying a test case that involves testing that an ever increasing number of videos can be transcoded:


```ruby
require File.dirname(__FILE__) + '/helper'
require File.dirname(__FILE__) + '/../lib/transcoder.rb'

context "Transcoder" do
  
  Dir.glob('videos/*').each do |video|
    it "should support #{video}" do
      Transcoder.convert(video, "site/#{video}.flv")[:file_size].should > 0
    end
  end
end
```
    

You can also use it to test model validations:


```ruby
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe "Product" do
  @@valid_product_attributes = { 
      :name         => 'WTF',
      :description  => 'LOL',
      :price        => '10.0',
      :tax          => '22.0'  }

  
  before(:each) do

  end

  it "should create a new instance given valid attributes" do
    Product.create!(@@valid_product_attributes)
  end
  
  @@valid_product_attributes.each do |name, value|
    it "should not allow blank #{name}" do
      lambda do
        Product.create!(@@valid_product_attributes.except(name))
      end.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
```
    

