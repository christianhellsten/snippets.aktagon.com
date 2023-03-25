---
id: '646'
title: Updating Passwords and Emails When Using Active Admin and Devise
languages:
- ruby
tags:
---
With Active Admin and Devise, we want to:
\* Skip email confirmations
\* Require password and email confirmations, but only when changing the email or password

This code supports our requirements:


```ruby
ActiveAdmin.register User do
  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      if params[:user][:email].blank?
        params[:user].delete("email")
        params[:user].delete("email_confirmation")
      end
      super
    end
  end

  before_save do |user|
    user.skip_confirmation!
    user.skip_reconfirmation!
  end
end
```
    

[See the Active Admin DSL for details](https://github.com/gregbell/active_admin/blob/master/lib/active_admin/resource_dsl.rb)

