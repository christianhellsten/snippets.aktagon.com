---
id: '513'
title: A simple configuration framework for storing a Rails app's configuration in
  YAML
languages:
- ruby
tags:
---
Also see: http://guides.rubyonrails.org/configuring.html#custom-configuration

Create config/initializers/configuration.rb:

```ruby
require 'ostruct'

# From https://www.ruby-forum.com/topic/137104
class NestedOstruct
  def self.to_ostruct(hash)
    mapping = {
      Hash => ->(s) { to_ostruct(s) },
      Array => ->(s) { s.collect { |i| i.is_a?(Hash) ? to_ostruct(i) : i } }
    }
    OpenStruct.new {}.tap { |h| hash.each { |k, v| h[k] = (mapping[v.class] || ->(s) { s })[v] } }
  end
end

config = YAML.load_file(Rails.root.join('config', 'application.yml'))[Rails.env].symbolize_keys
AppConfig = NestedOstruct.to_ostruct(config)
```
    

Create config/application.yml:


```ruby
development:
  twitter:
    api_key: xxx
    api_secret: xxx
production:
...
```
    

Use it in your application:


```ruby
AppConfig.twitter.api_key
```
    

