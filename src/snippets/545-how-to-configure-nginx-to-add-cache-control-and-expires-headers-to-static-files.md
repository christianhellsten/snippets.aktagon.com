---
id: '545'
title: How to configure nginx to add Cache-Control and Expires headers to static files
languages:
tags:
---

```
#
# Add expires header for static content
# images, fonts, css, javascript
#
location ~* \.(js|css|jpg|jpeg|gif|png|otf|eot|fft)$ {
  # If a file, add expires header
  if (-f $request_filename) {
    expires      7d; #max;
    add_header  Cache-Control public;
  } 

  # If not a file, pass on to Sinatra/Rails
  # Only needed if you want to let e.g. Dragonfly/ImageMagick process the request
  if (!-f $request_filename) {
    passenger_enabled on;
  }
}
```
    

