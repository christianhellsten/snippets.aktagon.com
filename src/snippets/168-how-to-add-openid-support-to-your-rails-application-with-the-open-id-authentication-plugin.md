---
id: '168'
title: How to add OpenID support to your Rails application with the open_id_authentication
  plugin
languages:
- ruby
tags:
- babel
- browserify
- build
- grunt
- gulp
- npm
---
These instructions have been tested with Rails 2.0.2 and ruby-openid 2.0.4. The snippet is an adaptation of the instructions in Ryan Bates' screencast on [how to integrate OpenID with Rails](http://railscasts.com/episodes/68).

Installing and configuring the restful\_authentication plugin
-------------------------------------------------------------

Follow these instructions: [How to install and use the restful\_authentication Rails plugin](http://snippets.aktagon.com/snippets/167-How-to-install-and-use-the-restful-authentication-Rails-plugin).

Installing the ruby-openid gem
------------------------------


```ruby
gem install ruby-openid
```
    

Installing the open\_id\_authentication Rails plugin
----------------------------------------------------


```ruby
script/plugin source http://svn.techno-weenie.net/projects/plugins/
script/plugin install open_id_authentication
```
    

Create the migration files
--------------------------


```ruby
rake open_id_authentication:db:create
```
    

Add the following to the self.up method in 002\_add\_open\_id\_authentication\_tables.rb:


```ruby
add_column :users, :identity_url, :string
```
    

Configuring the routes
----------------------


```ruby
map.open_id_complete 'session', :controller => "sessions", :action => "create", :requirements => { :method => :get }
```
    

Protect the identity\_url field
-------------------------------

Next protect the identity\_url field, by adding the following to user.rb, account.rb or your custom user model:


```ruby
attr_accessible :login, :email, :password, :password_confirmation, :identity_url
```
    

Add the following to the self.down method in 002\_add\_open\_id\_authentication\_tables.rb:


```ruby
remove_column :users, :identity_url
```
    

Integrating Open-id with the login page
---------------------------------------

Add the following to sessions/new.html.erb:


```ruby
<label for="openid_url">OpenID URL</label><br />
<%= text_field_tag "openid_url" %>
```
    

Make sure you're showing flash messages, otherwise you won't see the error messages:


```ruby
<html>
  <head></head>
  <body>
    <%= [:notice, :error].collect {|type| content_tag('div', flash[type], :id => type) if flash[type] } %>

    <%= yield %>
  </body>
</html>
```
    

Modifying the sessions controller
---------------------------------

Copy & paste the following code in app/controllers/sessions\_controller.rb:


```ruby
class SessionsController < ApplicationController
  # Hack to fix: No action responded to show
  def show
    create
  end

  def create
    if using_open_id?
      open_id_authentication(params[:openid_url])
    else
      password_authentication(params[:login], params[:password])
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end

  protected

  def open_id_authentication(openid_url)
    authenticate_with_open_id(openid_url, :required => [:nickname, :email]) do |result, identity_url, registration|
      if result.successful?
        @user = User.find_or_initialize_by_identity_url(identity_url)
        if @user.new_record?
          @user.login = registration['nickname']
          @user.email = registration['email']
          @user.save(false)
        end
        self.current_user = @user
        successful_login
      else
        failed_login result.message
      end
    end
  end

  def password_authentication(login, password)
    self.current_user = User.authenticate(login, password)
    if logged_in?
      successful_login
    else
      failed_login
    end
  end

  def failed_login(message = "Authentication failed.")
    flash.now[:error] = message
    render :action => 'new'
  end

  def successful_login
    if params[:remember_me] == "1"
      self.current_user.remember_me
      cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
    end
    redirect_back_or_default('/')
    flash[:notice] = "Logged in successfully"
  end
end
```
    

OpenID authentication from behind a proxy
-----------------------------------------

First, set the HTTP\_PROXY environment variable to the proxy URL:


```ruby
export HTTP_PROXY=http://proxy.aktagon.com:8080/
```
    

Then add the following to environment.rb:


```ruby
OpenID::fetcher_use_env_http_proxy
```
    

