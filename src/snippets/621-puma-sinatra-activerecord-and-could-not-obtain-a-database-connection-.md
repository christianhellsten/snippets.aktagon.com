---
id: '621'
title: Puma, Sinatra, ActiveRecord and "could not obtain a database connection"
languages:
- ruby
tags:
- error
- invalid_grant
- invalid_request
- oauth2
---
Getting connection errors with Puma, Sinatra and ActiveRecord?


```ruby
ActiveRecord::ConnectionTimeoutError at /
could not obtain a database connection within 5.000 seconds (waited 5.002 seconds)
```
    

Add this to your Sinatra application:


```ruby
use ActiveRecord::ConnectionAdapters::ConnectionManagement
```
    

