---
id: '979'
title: How to debug and fix chromedriver and selenium errors
languages:
- bash
tags:
---
You an enable the chromedriver log to debug and fix chromedriver and Selenium errors such as "unknown error: net::ERR_CONNECTION_REFUSED".

First start the chromedriver in the background:

```bash
nohup chromedriver --port=12345 --verbose --log-path=/tmp/chromedriver.log &
```

Then configure Selenium to use the chromedriver instance:

```bash
Capybara::Selenium::Driver.new(@app, browser: :chrome, options: ..., url: 'http://localhost:12345')
```

Next run the tests and inspect the chromedriver log.

In my case the issue was that an unreachable URL, see the unreachableUrl property in the output below:

```bash
[1659101781.048][DEBUG]: DevTools WebSocket Event: Page.frameNavigated B30A4B9FE0908FDACE0522341267520A {
   "frame": {
      "adFrameStatus": {
         "adFrameType": "none"
      },
      "crossOriginIsolatedContextType": "NotIsolated",
      "domainAndRegistry": "",
      "gatedAPIFeatures": [  ],
      "id": "B30A4B9FE0908FDACE0522341267520A",
      "loaderId": "595BC7FEFD2C1ECCE31157FF7972F889",
      "mimeType": "text/html",
      "secureContextType": "InsecureScheme",
      "securityOrigin": "://",
      "unreachableUrl": "http://localhost:3030/",
      "url": "chrome-error://chromewebdata/"
   },
   "type": "Navigation"
}
```

Thanks: https://makandracards.com/makandra/301588-how-to-enable-chromedriver-logging
