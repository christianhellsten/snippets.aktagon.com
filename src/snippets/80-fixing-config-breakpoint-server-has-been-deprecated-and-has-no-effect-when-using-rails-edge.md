---
id: '80'
title: Fixing "config.breakpoint_server has been deprecated and has no effect" when
  using Rails Edge
languages:
- ruby
tags:
---
You might get this error if you're using Rails Edge: **config.breakpoint\_server has been deprecated and has no effect**:

To fix the error we need to remove the following from **config/environments/development.rb**:


```ruby
config.breakpoint_server = true
```
    

Next install ruby-debug:


```ruby
gem install ruby-debug
```
    

Then add this to the end of **config/environments/development.rb**:


```ruby
require 'ruby-debug'
```
    

Next, start your server, and the error should be gone...

To debug your code just add a call to **debugger**:


```ruby
class MySillySpace ...
  def create
    debugger # add this line
  end
```
    

Now when you access the URL with your browser you'll have access to the debugger from the console window.

To learn how to use ruby-debug, read [this tutorial](http://www.datanoise.com/articles/2006/07/12/tutorial-on-ruby-debug) written by the ruby-debug author.

