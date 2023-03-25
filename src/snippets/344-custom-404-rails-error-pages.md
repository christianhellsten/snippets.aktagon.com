---
id: '344'
title: Custom 404 Rails error pages
languages:
- ruby
tags:
---
All credit for this snippet is due to [Henrik Nyh](http://henrik.nyh.se/2008/07/rails-404).

Put this in application\_controller.rb:


```ruby
alias_method :rescue_action_locally, :rescue_action_in_public if RAILS_ENV == 'development'
  
  def render_optional_error_file(status_code)
    if status_code == :not_found
      activate_authlogic
      render_404
    else
      super
    end
  end

  def render_404
    respond_to do |type| 
      type.html { render :template => "errors/error_404", :layout => 'application', :status => 404 } 
      type.all  { render :nothing => true, :status => 404 } 
    end

    true  # so we can do "render_404 and return"
  end
```
    

