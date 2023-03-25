---
id: '301'
title: How to create configurable Rails controllers
languages:
- ruby
tags:
- barcode
- '"code 39"'
- '"data matrix"'
- '"qr code"'
- zbar
- zxing
---
Beware this is a rough example of how to create configurable Rails controllers that hasn't been tested...

Somewhere in application.rb, preferrably at the top:


```ruby
class ActionController::Base
  def self.stylesheets(*params)
    if params.any?
      # do something here...
      write_inheritable_attribute(:stylesheets, params)
    else
      read_inheritable_attribute(:stylesheets)
    end
  end

  helper_method :stylesheets
  def stylesheets
    self.class.read_inheritable_attribute(:stylesheets)
  end
end
```
    

Then in your controllers:


```ruby
class ApplicationController < ActionController::Base
  stylesheets '...'
end

class MegaShit < ApplicationController
  stylesheets '...'
end
```
    

In your views, via the helper\_method (optional):


```ruby
<%= stylesheets %>
```
    

