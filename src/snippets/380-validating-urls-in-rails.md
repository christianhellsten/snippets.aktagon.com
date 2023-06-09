---
id: '380'
title: Validating URLs in Rails
languages:
- ruby
tags:
- decrypt
- encrypt
- gpg
- password
---
Minimalist implementation
-------------------------

A naïve implementation:


```ruby
validates_format_of :website, :with => URI::regexp(%w(http https))
```
    

via <http://mbleigh.com/2009/02/18/quick-tip-rails-url-validation.html>

Full-featured and reusable implementation
-----------------------------------------

A more full-featured and reusable example using the Addressable gem (app/validators/uri\_validator.rb):


```ruby
require 'addressable/uri'

#
# Validates URLs.
#
# @param options[:allow_uri] If true, validates only URI part of URL and skips host and scheme.
# @param options[:message] Error message.
# @param options[:allowed_protocols] Allowed protocols, e.g. [:http, :https].
#
class UriValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    uri = parse_uri(value)
    if !uri
      record.errors[attribute] << generic_failure_message
    elsif !allowed_protocols.include?(uri.scheme)
      record.errors[attribute] << "must begin with #{allowed_protocols_humanized}"
    end
  end

private

  def generic_failure_message
    options[:message] || "is an invalid URL"
  end

  def allowed_protocols_humanized
    allowed_protocols.to_sentence(:two_words_connector => ' or ')
  end

  def allowed_protocols
    @allowed_protocols ||= options.fetch(:allowed_protocols, ['http', 'https'])
  end

  def parse_uri(value)
    uri = Addressable::URI.parse(value)
    uri.scheme && uri.host && uri.to_s == value && uri
  rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
  end
end
```
    

Tests:


```ruby
require 'spec_helper'

describe UriValidator do
  let(:subject) do
    Class.new do
      include ActiveModel::Validations
      attr_accessor :url
      validates :url, uri: true
    end.new
  end

  VALID_URL = [ 'http://www.google.com',
                'http://.com', # NOTE: Addressable thinks this is valid
                'http://google' ]
  VALID_URL.each do |valid_url|
    it "accepts a valid URL (#{valid_url})" do
      subject.url = valid_url
      assert subject.valid?
      subject.errors.full_messages.should == []
    end
  end

  INVALID_URL = ['http://ftp://ftp.google.com',
                 'http://ssh://google.com',
                 '//www.google.com',
                 'www.google.com',
                 'google.com',
                 'http:/www.google.com',
                 '<>hi' ]
  INVALID_URL.each do |invalid_url|
    it "#{invalid_url} is an invalid url" do
      subject.url = invalid_url
      subject.valid?
      binding.pry if subject.valid?
      subject.errors.should have_key(:url)
      subject.errors[:url].should include("is an invalid URL")
    end
  end

  INVALID_PROTOCOL = [ 'ftp://ftp.google.com',
                       'ssh://google.com' ]
  INVALID_PROTOCOL.each do |invalid_url|
    it "#{invalid_url} is an invalid url" do
      subject.url = invalid_url
      subject.valid?
      subject.errors.should have_key(:url)
      subject.errors[:url].should include("must begin with http or https")
    end
  end
end
```
    

Code based on http://gist.github.com/bf4/5320847.

