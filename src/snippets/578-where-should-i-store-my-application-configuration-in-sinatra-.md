---
id: '578'
title: Where should I store my application configuration in Sinatra?
languages:
- ruby
tags:
- macos
- scryer-prolog
---
This is one option:


```ruby
require 'yaml'
require 'ostruct'
require 'sinatra/base'

# Usage:
#
# config/application.yml:
#   development:
#     username: ...
#   production:
#     username: ...
#   url: http://...
#
# app.rb:
# class App < Sinatra::Base                    
#   register Sinatra::Configuration            
#   load_configuration 'config/application.yml'
#   get '/' do
#     App.configuration.username
#   end
#
module Sinatra
  module Configuration
    # From https://www.ruby-forum.com/topic/137104
    class NestedOstruct
      def self.new(hash={})
        OpenStruct.new(hash.inject({}){|r,p| r[p[0]] = p[1].kind_of?(Hash) ?  NestedOstruct.new(p[1]) : p[1]; r })
      end

      def self.to_ostruct(object)
        return case object
        when Hash
          object = object.clone
          object.each do |key, value|
            object[key] = to_ostruct(value)
          end
          OpenStruct.new(object)
        when Array
          object = object.clone
          object.map! { |i| to_ostruct(i) }
        else
          object
        end
      end
    end

    def self.registered(base)
      base.set :environments, %w[test development staging production]
    end

    def load_configuration(file, namespace = :configuration)
      set namespace, parse_configuration(YAML.load_file(file)) || {}
    end

    private

    def parse_configuration(hash)
      base = hash.except(*environments)
      base.merge!(hash[environment.to_s])
      NestedOstruct.to_ostruct(base)
    end
  end

  register Configuration
  Delegator.delegate :load_configuration
end
```
    

