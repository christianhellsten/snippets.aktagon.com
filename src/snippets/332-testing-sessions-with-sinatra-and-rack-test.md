---
id: '332'
title: Testing sessions with Sinatra and Rack::Test
languages:
- ruby
tags:
---
You need support for testing sessions when, for example, testing authentication. The only way I've managed to get sessions to work with Sinatra and Rack::Test is by going through the whole stack, in other words calling the authentication controller as shown here:


```ruby
@user = Factory(:user) # create a dummy user
User.expects(:authenticate).with(any_parameters).returns(@user) # make authenticate return the dummy user
post "/sign-in", {:email => @user.email, :password => @user.password} # login to the application and set a session variable.
```
    

After this the session populated and we're logged in when accessing the application again:


```ruby
post "/articles", {:title => 'Sessions suck', :body => '...'}
```
    

On a side note, there are two ways of specifying sessions that used to work, but which no longer work with Sinatra 1.0:


```ruby
get '/', :env => { :session => {:abc => 'adf'} }
get '/', {}, :session => {:abc => 'adf'}
get '/', {}, "rack.session" => {:abc => 'adf'}
```
    

The session is always empty.

There are many discussions about sessions and Rack::Test, but not one of them has a solution that works for me:
\* [rack.session variable is missing env under test environment](https://sinatra.lighthouseapp.com/projects/9779/tickets/314-racksession-variable-is-missing-env-under-test-environment)
\* [Sessions with rspec and Rack.Test](http://groups.google.com/group/sinatrarb/browse_thread/thread/a9de4f690631b3a1)

