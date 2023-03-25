---
id: '203'
title: Sorting an array according to a specific language using Gibberish.
languages:
- ruby
tags:
---
You can use Ruby's [Enumerable sort\_by](http://www.ruby-doc.org/core/classes/Enumerable.html#M001136) to sort an array correctly using [Gibberish](http://errtheblog.com/posts/55-ya-talkin-gibberish) and [Gibberish DB](http://github.com/caring/gibberish_db/tree/master)

It's not pretty, but it works on non-paginated lists. For pagination something else must bee cooked up. Here I sort an array of Category objects according to the localized name of the category.


```ruby
@categories = @categories.sort_by{|a| 
      a[:name][].to_s
    }
```
    

