---
id: '481'
title: PassengerPreStart, PassengerFriendlyErrorPages, and PassengerMinInstances  -
  Three essential configuration parameters in Phusion Passenger 3.0
languages:
- ruby
tags:
---
Apache
------

This setting will make your users and the Google bot happy by starting your application as soon as Apache/nginx starts:


```ruby
PassengerPreStart http://aktagon.com/
```
    

When combined with the PassengerMinInstances parameter, Passenger will keep at least one instance alive at all times:


```ruby
PassengerMinInstances 1
```
    

This setting makes hackers unhappy by disabling Passenger's default error page, which contains sensitive information:


```ruby
PassengerFriendlyErrorPages On
```
    

[Read passenger's Apache documentation](http://www.modrails.com/documentation/Users%20guide%20Apache.html) for details.

nginx
-----

Passenger's nginx module has a slightly different naming convention:


```ruby
passenger_min_instances 1
passenger_friendly_error_pages on
```
    

Plus you need to put the passenger\_pre\_start inside an http directive. I just put them all in passenger.conf:


```ruby
passenger_pre_start http://aktagon.com
```
    

If you don't put it where it belongs, you'll get this error:


```ruby
Starting nginx: [emerg]: "passenger_pre_start" directive is not allowed here in /opt/nginx/conf/sites/xxx.com:7
```
    

[Read Passenger's nginx documentation](http://www.modrails.com/documentation/Users%20guide%20Nginx.html#PassengerPreStart) for details.

