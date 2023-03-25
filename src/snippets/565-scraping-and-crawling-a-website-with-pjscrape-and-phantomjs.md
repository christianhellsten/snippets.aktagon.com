---
id: '565'
title: Scraping and crawling a website with pjscrape and PhantomJS
languages:
- javascript
tags:
- division
- nullif
- postgres
- zero
---

```javascript
pjs.addSuite({
  url: 'http://google.com',
  maxDepth: 1,
  loadScript: ['underscore-min.js'],
  ignoreDuplicates: true,
  moreUrls: function() {
    var urls = _pjs.getAnchorUrls('a', false);
    var result = _.filter(urls, function (url) {
      return url.indexOf('javascript') == -1
    });
    console.log("Found " + urls.length + " urls. Using " + result.length)
    return result
  },
  scraper: function() {
    var result = []
    var links = $('a')
    links = links.map(function(index, elem) { 
      return $(elem).text()
    }).toArray()
    result = result.concat(links)
    return result
  }
});
```
    

