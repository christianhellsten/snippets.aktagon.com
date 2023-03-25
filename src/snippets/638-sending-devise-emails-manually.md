---
id: '638'
title: Sending Devise Emails Manually
languages:
- ruby
tags:
---

```ruby
user = User.new email: 'bill@gates.com'
Devise.mailer_sender = 'no-reply@gates.com'
Devise.mailer.confirmation_instructions(user, self).deliver!
```
    

