---
id: '434'
title: How to use dual-purpose accessors in Ruby to create a DSL
languages:
- ruby
tags:
---
Instead of this:


```ruby
Sitemap('public/sitemap.xml') do
  self.stylesheet = 'public/sitemap.xls'  
  self.ping = ['http://www.google.com', 'http://www.google.com']  
end
```
    

You could write this:


```ruby
Sitemap('public/sitemap.xml') do
  stylesheet 'public/sitemap.xls'  
  ping ['http://www.google.com', 'http://www.google.com']  
end
```
    

Using [dual-purpose accessors](http://sandal.github.com/rbp-book/pdfs/ch03.pdf):


```ruby
class Sitemap
  def stylesheet(path = nil) 
    return @path unless path
   @path = path
  end
  alias_method :stylesheet=, :stylesheet 
  ...
end
```
    

