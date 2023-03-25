---
id: '634'
title: Integration of bootstrap and Rails forms
languages:
- ruby
tags:
- mount
- podman
- volume
---
Add this to config/initializers/bootstrap.rb:


```ruby
# NOTE Bootstrap form errors
Rails.configuration.action_view.field_error_proc = Proc.new { |html_tag, instance|
  %{<div class="has-error">#{html_tag}</div>}.html_safe
}
```
    

Also see:
<https://gist.github.com/bogdanconstantinescu/2645498>

