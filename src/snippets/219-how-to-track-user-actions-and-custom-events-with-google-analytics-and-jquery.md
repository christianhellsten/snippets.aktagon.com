---
id: '219'
title: How to track user actions and custom events with Google Analytics and jQuery
languages:
- javascript
tags:
- bundler
- rails
- ruby
- rubygems
---
This is a customization of [Rebecca Murphey's](http://blog.rebeccamurphey.com/2008/01/06/track-outbound-clicks-with-google-analytics-and-jquery/) script:


```javascript
$('a').each(function() {
	var $a = $(this);
	var href = $a.attr('href');
	
	if(typeof pageTracker == 'undefined') { return; }

	// Link is external
	if (href.match(/^http/) && !href.match(document.domain)) {
		$a.click(function() {
			pageTracker._trackPageview('/external/' + href);
		});
	} else {
		$a.click(function() {
			pageTracker._trackPageview('/internal' + href);
		});
	}
});
```
    

Note that clicks are shown as page views in reports, so you should exclude them from all reports. A future version of Google Analytics will allow you to track events, such as mouse clicks, without affecting page view reporting, see [this page on the new event tracking beta feature](http://code.google.com/apis/analytics/docs/eventTrackerOverview.html) for more information.

