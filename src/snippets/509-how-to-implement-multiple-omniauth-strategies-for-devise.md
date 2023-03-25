---
id: '509'
title: How to implement multiple OmniAuth strategies for Devise
languages:
- ruby
tags:
- programming
- table-driven
---
This snippet is useful if you're using Devise and OmniAuth for authentication and need to support authentication with, for example, two separate Facebook applications.

First, put this in, for example, lib/omniauth\_i18n.rb:


```ruby
# The "name" method defines the URL, so the URL becomes /users/auth/facebook_x
module OmniAuth::Strategies
   class FacebookX < Facebook
    def name 
       :facebook_x
    end 
  end
  class FacebookY < Facebook
    def name 
       :facebook_y
    end 
  end
end
```
    

Configure each strategy separately in **config/initializers/devise.rb**:


```ruby
config.omniauth :facebook_x, 'yyy', 'yyy'
config.omniauth :facebook_y, 'zzz', 'zzz'
```
    

This was tested with devise 1.1, oa-auth 0.1.6 and oauth 0.4.4, and will probably break sometime in the future. OmniAuth supports [dynamic strategies](https://github.com/intridea/omniauth/wiki/Dynamic-Providers)

