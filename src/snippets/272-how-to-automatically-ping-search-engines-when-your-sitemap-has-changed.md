---
id: '272'
title: How to automatically ping search engines when your sitemap has changed
languages:
- ruby
tags:
---
I prefer letting cron update sitemaps in the background, and at the end of the script I ping search engines to let them know it's been updated:


```ruby
# Recreate sitemap goes here

# Let search engines know about the update
[ "http://www.google.com/webmasters/tools/ping?sitemap=http://xxx/sitemap.xml",
  "http://search.yahooapis.com/SiteExplorerService/V1/ping?sitemap=http://xxx/sitemap.xml",
  "http://submissions.ask.com/ping?sitemap=http://xxx/sitemap.xml",
  "http://webmaster.live.com/ping.aspx?siteMap=http://xxx/sitemap.xml" ].each do |url|
  open(url) do |f|
    if f.status[0] == "200"
      puts "Sitemap successfully submitted to #{url}"      
    else
      puts "Failed to submit sitemap to #{url}"
    end
  end
end
```
    

More about sitemaps: http://en.wikipedia.org/wiki/Sitemaps

