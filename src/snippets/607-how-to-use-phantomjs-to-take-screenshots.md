---
id: '607'
title: How to use PhantomJS to take screenshots
languages:
- javascript
tags:
---

```javascript
page = new WebPage()
if phantom.args.length < 2 or phantom.args.length > 3
  console.log "Usage: phantomjs screenshot.coffee URL filename"
  phantom.exit()
else
  address = phantom.args[0]
  output = phantom.args[1]
  ua = "User-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.101 Safari/537.11"
  page.settings.userAgent = ua
  page.customHeaders = "Accept-Language": "sv-SE,sv;q=0.8,en-US;q=0.6,en;q=0.4"
  page.viewportSize =
    width: 1024
    height: 760

  page.open address, (status) ->
    if status isnt "success"
      console.log "Unable to load the address!"
      phantom.exit()
    else
      window.setTimeout (->
        page.clipRect =
          top: 0
          left: 0
          width: 1024
          height: 760

        page.render output
        console.log "Exiting"
        phantom.exit()
      ), 200
```
    

Usage:


```javascript
screenshot.coffee http://google.com google.png
```
    

