---
id: '512'
title: How to post a message to the Facebook wall with OmniAuth/Devise
languages:
- ruby
tags:
- database
- database_cleaner
- python
- test
---
In your [OmniAuth/Devise-callback controller](http://railscasts.com/episodes/235-omniauth-part-1) add this line:


```ruby
# https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema
session['fb_access_token'] = omniauth['credentials']['token']
```
    

This will save the auth\_token, which we’ll need for accessing the Facebook API.

Next, in your Devise initializer, usually config/initializer/devise.rb, request additional permissions:


```ruby
config.omniauth :facebook, 'heh', 'lol', :scope => 'publish_stream,email,offline_access,manage_pages'
```
    

The offline\_access permission means you can use the token even if the user logs out.

Now if a user logs in you’ll have access to the user’s Facebook access\_token, which can be used to post to his wall.


```ruby
api_key = 'heh'
api_secret = 'lol'

client = OAuth2::Client.new(api_key, api_secret, :site => 'https://graph.facebook.com')
token = OAuth2::AccessToken.new(client, session['fb_access_token'])
token.post('/me/feed', :message => "testing")
```
    

To understand how it all works, read about [Facebook permissions](http://developers.facebook.com/docs/authentication/permissions/), the [Graph API](http://developers.facebook.com/docs/reference/api/) and the [documentation on the post command](http://developers.facebook.com/docs/reference/api/post/).

Getting the Access Token
------------------------

You can also use this URL to get a permanent access\_token:


```ruby
https://graph.facebook.com/oauth/access_token?type=client_cred&client_id=<app_key>&client_secret=<app_secret>
```
    

Posting links
-------------

Use <http://developers.facebook.com/docs/reference/api/link/> to post links.

Posting to a page
-----------------

When posting to a page you need to change "me" to the page name:


```ruby
token.post('/acmexxx/post', :message => "testing")
```
    

If you need to post to the page as the page itself, not the admin user, you need to get the access\_token for the page.

First you need to add the manage\_pages permission:


```ruby
config.omniauth :facebook, 'heh', 'lol', :scope => 'publish_stream,email,offline_access,manage_pages'
```
    

You should now login as the page admin and get a new access\_token, which you can then use to get a list of accounts and pages you are the administrator for:


```ruby
https://graph.facebook.com/me/accounts?access_token=<admin_access_token>
```
    

You should see the access\_token for each page listed in the response, use it to post to the page as the page.

