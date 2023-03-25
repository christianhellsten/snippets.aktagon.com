---
id: '215'
title: Restricting CPU usage for Autotest
languages:
- ruby
tags:
- accept
- go
---
Autotest sucks by default up all the cpu cycles. I found a solution for it [here](http://www.movesonrails.com/articles/2008/02/06/autotest-100-cpu-solution).

Add this to $HOME/.autotest


```ruby
Autotest.add_hook :initialize do |at|
  at.sleep = 5
end
```
    

