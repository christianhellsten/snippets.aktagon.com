---
id: '218'
title: How to exclude your own traffic from Google Analytics reports and other JavaScript
  based analytics software
languages:
- ruby
tags:
---
Option 1: Changing your browser's user agent
--------------------------------------------

Open the about:config page in Firefox by typing about:config in the address bar and pressing enter. Now change the general.useragent.extra.firefox setting to an easily identifiable string, for example the following:


```ruby
Firefox/3.0 disable-tracking
```
    

Then in your code check that the user-agent string doesn't contain [disable-tracking]()


```ruby
<% if !request.user_agent.include?('disable-tracking') %>
TRACKING CODE GOES HERE
<% end %>
```
    

Option 2:
---------

Use one of Google Analytics native ways of excluding traffic from certain domains, IPs, user-agents or users having a specific browser cookie.

