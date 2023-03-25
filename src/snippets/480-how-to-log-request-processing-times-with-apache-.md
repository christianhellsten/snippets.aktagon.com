---
id: '480'
title: 'How to log request processing times with Apache '
languages:
- apacheconf
tags:
---
To log the time it takes for Apache to process a request add this to your apache configuration file:


```apacheconf
LogFormat "%h %D %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
```
    

%D means you'll see the time it took Apache to process the request in the access log. The time is measured in microseconds.

To make it even easier to debug page load times, add this to your configuration file:


```apacheconf
Header set X-Request-Received: %t
Header set X-Request-Processing-Time: %D
```
    

Remember to enable mod\_headers first by executing **a2enmod headers**.

Now you should see these headers in the response:


```apacheconf
X-Request-Received	t=1286995673038485
X-Request-Processing-Time	D=251
```
    

