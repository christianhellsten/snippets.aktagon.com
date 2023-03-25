---
id: '47'
title: How to use Rails helpers from controllers, models, anywhere
languages:
- ruby
tags:
---
How to use e.g. url\_for where you need it, not where you’ve been told to use it:

Rails 4
-------


```ruby
ActionController::Base.helpers.escape_javascript(text)
ActionController::Base.helpers.image_path(path)
```
    

Rails 3
-------


```ruby
class URLHelper
  include Singleton
  include ActionDispatch::Routing::UrlFor
  include Rails.application.routes.url_helpers
end
```
    

Rails 1-2.x
-----------

Use this snippet if you need to use one of the many Rails helpers in controllers or elsewhere:


```ruby
class Helpers
    include Singleton
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::ActiveRecordHelper
end
```
    

Console
-------

You can test named routes in the console through the app object:


```ruby
app.get '/'
# Named route
app.image_path Image.first
```
    

Usage
-----

For example, to obfuscate email use the **mail\_to** helper and set the encoding to JavaScript:


```ruby
Helpers.instance.mail_to "me@domain.com", "My email", :encode => "javascript"
```
    

In Rails controllers there's no need to do anything, simply use the template instance to call helpers:


```ruby
def index
   @template.link_to x, x.title
end
```
    

Troubleshooting
---------------

If you get this error:


```ruby
Missing host to link to! Please provide :host parameter or set default_url_options[:host]
```
    

Fix it by specifying the host:


```ruby
URLHelper.default_url_options[:host] = 'xxx.com'
```
    

