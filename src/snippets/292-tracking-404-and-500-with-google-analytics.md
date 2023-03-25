---
id: '292'
title: Tracking 404 and 500 with Google Analytics
languages:
- javascript
tags:
---
New Google Analytics
--------------------


```javascript
_gaq.push(['_trackEvent', 'HTTP status', '404', '/xxx/what-a-fish']);
```
    

Old Google Analytics
--------------------

Tracking 404 and 500 errors with Google Analytics is [documented here](http://www.google.com/support/analytics/bin/answer.py?hl=en&answer=86927), but I tend to forget so I'm putting the information here:


```javascript
// 404
pageTracker._trackPageview("/404.html?page=" + document.location.pathname + document.location.search + "&from=" + document.referrer);

// 500
pageTracker._trackPageview("/500.html?page=" + document.location.pathname + document.location.search + "&from=" + document.referrer);
```
    

Rails
-----

In Rails use the response status code to track any HTTP errors:


```javascript
<% if response.status != 200 %>
_gaq.push(['_trackEvent', 'HTTP status', '<%= response.status %>', '<%= request.fullpath %>']);
<% end %>
```
    

