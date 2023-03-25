---
id: '326'
title: Rails plugin template
languages:
- ruby
tags:
- container
- docker
- docker-compose
- host
- ip
- rtfm
- subnet
- ufw
---

```ruby
script/plugin generate PluginTemplate
```
    


```ruby
module PluginTemplate
  def self.included(base)
    base.class_eval do
      include InstanceMethods
      extend ClassMethods

      alias_method_chain :rescue_action_in_public, :gulag
      alias_method_chain :rescue_action_locally, :gulag
    end
  end

  module ClassMethods
  end

  module InstanceMethods
  end
end
```
    

init.rb:


```ruby
ActionController.send :include, PluginTemplate
```
    

