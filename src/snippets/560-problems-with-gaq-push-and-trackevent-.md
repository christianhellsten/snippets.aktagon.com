---
id: '560'
title: Problems with _gaq.push and _trackEvent?
languages:
- javascript
tags:
---
Problems with \_gaq.push and \_trackEvent?

1. Check JavaScript/Firebug console for errors.
2. Check that all values are in supported format, e.g. [the value parameter must be an integer](https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide)
3. Use the queue to postpone or perform actions in sequence:


```javascript
_gaq.push(['_trackEvent',...])
_gaq.push(function() {
      document.location = 'http://google.com'
})
```
    

