---
id: '317'
title: Rugalytics How-to
languages:
- ruby
tags:
- amqp
- bunny
- rabbitmq
- ruby
---

```ruby
require 'rubygems'
require 'rugalytics'

Rugalytics.login 'username', 'password'

profile_name = 'xxx.xxx'
site = 'xxx'

profile = Rugalytics.find_profile(profile_name, site)
report = profile.top_content_report(:from=> (Date.today - 10.years), :rows => 1000, :offset => 500 )
pages = report.items.sort_by{|i| i.unique_pageviews.to_i}.reverse

File.open('report', 'w') do |file|
  pages.each do |page|
    file << page.unique_pageviews + "    " + page.url + "\n"
  end
end
```
    

