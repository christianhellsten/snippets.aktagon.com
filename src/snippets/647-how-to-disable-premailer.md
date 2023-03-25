---
id: '647'
title: How to Disable Premailer
languages:
- ruby
tags:
- commit
- gotcha
- rails
- rollback
- transaction
---
If you want to disable Premailer in a Rails console use this hack:


```ruby
class Premailer
  module Rails
    class Hook
      def perform
      end
    end
  end
end
```
    

For other, non-permanent options see:
<https://github.com/fphilipe/premailer-rails/blob/master/lib/premailer/rails/hook.rb>

