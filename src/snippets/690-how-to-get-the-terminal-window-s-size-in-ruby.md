---
id: '690'
title: How to get the terminal window's size in Ruby
languages:
- ruby
tags:
---

```ruby
require 'io/console'
IO.console.winsize
```
    

In the terminal you can use **tput cols**.

