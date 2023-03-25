---
id: '44'
title: Check which of your pages are in the Google supplemental index a.k.a Google
  hell
languages:
tags:
---
Try this query to find pages that are in Google's supplemental index (trick invented by [Bruce Clay, Inc](http://www.bruceclay.com/blog/archives/2007/08/google_hack_fin.html)):


```
-site:aktagon.com/* +site:aktagon.com/
```
    

The query should list all of your pages that are in [Google's supplemental index](http://en.wikipedia.org/wiki/Supplemental_Result) a.k.a [Google hell](http://www.seomoz.org/blog/how-i-escaped-googles-supplemental-hell). These pages lower your Google page rank, so you should tell Google not to bother indexing those pages. This can be done with [robots.txt](http://en.wikipedia.org/wiki/Robots.txt):


```
User-agent:*
Disallow: /tags/*
Disallow: /archive/*
```
    

Another way of doing it is to add a meta tag:


```
<meta name="robots" content="noindex,follow"/>
```
    

This tells search engines to read the page but not index it.

And, be careful with what you put in robots.txt...

