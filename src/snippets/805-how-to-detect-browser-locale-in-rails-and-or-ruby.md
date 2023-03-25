---
id: '805'
title: How to detect browser locale in Rails and/or Ruby
languages:
- ruby
tags:
---
```ruby
def browser_locale(request)
  locales = request.env['HTTP_ACCEPT_LANGUAGE'] || ""
  locales.scan(/[a-z]{2}(?=;)/).find do |locale|
    I18n.available_locales.include?(locale.to_sym)
  end
end
```
