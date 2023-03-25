---
id: '237'
title: A simple Python HTTP client
languages:
- python
tags:
---
A simple HTTP client I had laying around that I wrote a long time ago. It supports cookies, redirects and stuff:


```python
#!/usr/bin/env python
#
#     Http
#
#     A simple HTTP client that supports persistent cookies
#

import cookielib
import httplib
#httplib.HTTPConnection.debuglevel = 1
import urllib2

class Http:
  def __init__(self, redirect_callback = None):
    self.redirect_callback = redirect_callback
    self.cookie_jar = cookielib.CookieJar()
    self.opener = urllib2.build_opener(urllib2.HTTPCookieProcessor (self.cookie_jar))

    urllib2.install_opener(self.opener)

  def get(self, url, headers = None):
    request = urllib2.Request(url, headers = headers)
    return self.execute_request(request)

  def post(self, url, headers = None, parameters = None):
    data = None
    if parameters != None:
      data = urllib.urlencode(parameters)

    request = urllib2.Request(url, data, headers)
    return self.execute_request(request)

  def execute_request(self, request):
    response = self.opener.open(request)
    # Check for redirect, maybe better way to do this
    if response.geturl() != request.get_full_url():
      if self.redirect_callback == None:
        raise "Redirected to '" + response.geturl() + "' but no redirect callback defined"
      else:
        self.redirect_callback(response)

    return response
```
    

