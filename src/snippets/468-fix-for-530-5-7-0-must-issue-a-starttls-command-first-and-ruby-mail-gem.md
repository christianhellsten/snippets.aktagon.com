---
id: '468'
title: Fix for "530 5.7.0 Must issue a STARTTLS command first" and Ruby mail gem
languages:
- ruby
tags:
---
I'm using the [mail gem](http://github.com/mikel/mail) and received this error when sending emails:


```ruby
530 5.7.0 Must issue a STARTTLS command first
```
    

The fix was to first install the tlsmail gem:


```ruby
gem install tlsmail
```
    

Then I had to add this to config/initializers/email.rb:


```ruby
require 'tlsmail' 
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
```
    

