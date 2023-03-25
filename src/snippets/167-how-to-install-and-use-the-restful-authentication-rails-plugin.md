---
id: '167'
title: How to install and use the restful_authentication Rails plugin
languages:
- ruby
tags:
---
This is an adaptation of the [restful\_authentication screencast](http://railscasts.com/episodes/67) by Ryan Bates, which has an issue with Rails 2.0.3 that throws the following error:


```ruby
NameError (uninitialized constant SessionsController):
    /usr/local/lib/ruby/gems/1.8/gems/activesupport-2.0.2/lib/active_support/dependencies.rb:266:in load_missing_constant'
    /usr/local/lib/ruby/gems/1.8/gems/activesupport-2.0.2/lib/active_support/dependencies.rb:453:in const_missing'
    /usr/local/lib/ruby/gems/1.8/gems/activesupport-2.0.2/lib/active_support/dependencies.rb:465:in const_missing'
    /usr/local/lib/ruby/gems/1.8/gems/activesupport-2.0.2/lib/active_support/inflector.rb:257:in constantize'
```
    

Installing the restful\_authentication plugin
---------------------------------------------


```ruby
script/plugin source http://svn.techno-weenie.net/projects/plugins/
script/plugin install restful_authentication
```
    

Generating the model and controller
-----------------------------------


```ruby
script/generate authenticated user sessions
```
    

Now run the migration:


```ruby
rake db:migrate
```
    

Configure routing
-----------------

Open config/routes.rb and add the following routes:


```ruby
map.resources :users
map.resource  :session

map.signup '/signup', :controller => 'users', :action => 'new'
map.login  '/login', :controller => 'sessions', :action => 'new'
map.logout '/logout', :controller => 'sessions', :action => 'destroy'
```
    

Include restful\_authentication in ApplicationController
--------------------------------------------------------

First remove these lines from the users and sessions controllers:


```ruby
# Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
```
    

Now include restful\_authentication in the application controller:


```ruby
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
```
    

Integrate restful\_authentication with your views
-------------------------------------------------

First let's create a controller and view by executing the generate script:


```ruby
script/generate controller home index
```
    

Modify index.html.erb as follows:


```ruby
<h1>Welcome</h1>

<% if logged_in? %>
  <p><strong>You are logged in as <%=h current_user.login %></strong></p>
  <p><%= link_to 'Logout', logout_path %></p>
<% else %>
  <p><strong>You are currently not logged in.</strong></p>
  <p>
    <%= link_to 'Login', login_path %> or
    <%= link_to 'Sign Up', signup_path %>
  </p>
<% end %>
```
    

Start Rails and access your application. If needed, add the following to config/routes.rb to make the home controller the default:


```ruby
map.root :controller => "home"
```
    

Login, sign up and logout should work.

