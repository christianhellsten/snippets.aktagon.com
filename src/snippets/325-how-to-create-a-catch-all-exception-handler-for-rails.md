---
id: '325'
title: How to create a catch-all exception handler for Rails
languages:
- ruby
tags:
---
Rails' exception handling is defined in this file /usr/local/lib/ruby/gems/1.8/gems/actionpack-2.3.2/lib/action\_controller/rescue.rb. To intercept all errors in your Rails app, you can do this:


```ruby
module GulagNotifier
  def self.included(base)
    if base.instance_methods.include?("rescue_action_in_public")
      base.module_eval { alias_method_chain :rescue_action_in_public, :gulag }
    end
    if base.instance_methods.include?("rescue_action_locally")
      base.module_eval { alias_method_chain :rescue_action_locally, :gulag }
    end
  end

  def rescue_action_locally_with_gulag(exception)
    send_to_gulag(exception)
    rescue_action_locally_without_gulag(exception)
  end

  def rescue_action_in_public_with_gulag(exception)
    send_to_gulag(exception)
    rescue_action_in_public_without_gulag(exception)
  end 

  def send_to_gulag(exception)
# Do whatever you want with the exception
  end
  
end
```
    

