---
id: '378'
title: Shoulda+rr+factory_girl+fakeweb example
languages:
- ruby
tags:
---

```ruby
require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  def stub_feed_url(url)
    body = feed_for_url(url)
    FakeWeb.register_uri(:get, "#{url}", :body => body)
  end

  def feed_for_url(url)
    uri = URI.parse(url)
    File.read("test/fixtures#{uri.path}")
  end

  context "on POST /subscribe" do
    context "with an existing feed" do
      setup do
        url = "http://dummy/valid-feeds/svd.se.xml"
        @user = Factory(:user)
        @feed = Feed.create!(:url => url)

        stub(@controller).current_user { @user }

        stub_feed_url(@feed.url)

        post :subscribe, :url => @feed.url
      end

      should_assign_to :subscription
      should_respond_with :success
      should_render_template :subscribe

      should "create a subscription" do
        assert_equal @user.subscriptions.size, 1
      end
    end
  end
end
```
    

test\_helper.rb


```ruby
.
.
require "rr"

include RR::Adapters::RRMethods

class ActiveSupport::TestCase
.
.
```
    

