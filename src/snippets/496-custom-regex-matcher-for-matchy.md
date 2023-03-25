---
id: '496'
title: Custom regex matcher for matchy
languages:
- ruby
tags:
- __dict__
- as_json
- to_json
---
Gemfile:


```ruby
group :test do  
  gem 'jnunemaker-matchy'
end
```
    

test\_helper.rb:


```ruby
class ActiveSupport::TestCase
  custom_matcher :match do |receiver, matcher, args|
    regex = args[0]
    matcher.positive_failure_message = "Expected #{receiver} to match #{regex}"
    matcher.negative_failure_message = "Expected #{receiver} not to match #{regex}"
    receiver.match(regex) != nil
  end
end
```
    

Your test:


```ruby
current_path.should match(/\/admin\/companies\/.+/)
```
    

