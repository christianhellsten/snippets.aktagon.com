---
id: '494'
title: 'Fixing Shoulda''s "ArgumentError: wrong number of arguments (0 for 1)"'
languages:
- ruby
tags:
- bug
- compatibility
- html
- ie
- '"internet explorer"'
---
If you get this error with Shoulda 2.11.3:


```ruby
ArgumentError: wrong number of arguments (0 for 1)
```
    

you probably named your test class TestSomething instead of SomethingTest. Fix this by renaming the class to SomethingTest.

