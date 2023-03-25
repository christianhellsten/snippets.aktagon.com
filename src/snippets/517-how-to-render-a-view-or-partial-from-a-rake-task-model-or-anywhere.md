---
id: '517'
title: How to render a view or partial from a Rake task, model or anywhere
languages:
- ruby
tags:
---
This is tested with Rails 3.0.7 and will most likely change in future versions of Rails:


```ruby
# @newsletter in the view file
assigns = { :newsletter => self }

routes = Rails::Application.routes # Rails => YourApp
routes.default_url_options = { :host => 'xxx.com' }

av = ActionView::Base.new(Rails::Application::Configuration.new(Rails.root).paths.app.views.first, assigns)
av.class_eval do
  include ApplicationHelper
  include routes.url_helpers
end

self.html = av.render :template => 'newsletters/show'
```
    

After some experimentation I ended up with this code:


```ruby
class RenderHelper
  class << self
    def render(assigns, options, request = {})
      request = { 
        "SERVER_PROTOCOL" => "http", 
        "REQUEST_URI" => "/",
        "SERVER_NAME" => "localhost", 
        "SERVER_PORT" => 80
      }.merge(request)

      av = ActionView::Base.new(ActionController::Base.view_paths, assigns)
      
      av.config = Rails.application.config.action_controller
      av.extend ApplicationController._helpers
      av.controller = ActionController::Base.new
      av.controller.request = ActionController::Request.new(request)
      av.controller.response = ActionController::Response.new
      av.controller.headers = Rack::Utils::HeaderHash.new

      av.class_eval do
        include Rails.application.routes.url_helpers
      end

      av.render options 
    end
  end
end
```
    

And this is how I use it:


```ruby
RenderHelper.render(:newsletter => self, :template => 'mailchimp/daily')
```
    

