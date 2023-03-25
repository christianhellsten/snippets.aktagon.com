---
id: '502'
title: Rails Cells Example
languages:
- ruby
tags:
---
This [Rails Cells](http://cells.rubyforge.org/) example demonstrates how to:
\* access the request
\* access the controller
\* access the session
\* access the request parameters
\* cache data
\* use dynamic cache keys
\* access cell parameters
\* use helpers


```ruby
class MenuCell < Cell::Rails
  helper :menu
  cache :display, :cache_conf, :expires_in => 1.day

  def display
    @selected = options[:selected]
    @posts ||= Post.paginate(options[:posts])
    render
  end

  protected
    def cache_conf
      # parent_controller.controller_name
      # parent_controller.request or request
      # parent_controller.session
      # parent_controller.params
      { :path => request.fullpath }
    end
end
```
    

The cell is rendered by calling:


```ruby
<%= render_cell :menu, :display, :selected => controller.controller_name %>
```
    

See [Cells the change log](https://github.com/apotonick/cells/blob/master/CHANGES.textile) for details.

