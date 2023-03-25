---
id: '489'
title: Using Garb to get unique pageviews per page from Google Analytics
languages:
- ruby
tags:
- fail2ban
- hex
- https
- nginx
- ssl
---

```ruby
require 'rubygems'
require 'garb'

CA_CERT_FILE = "cacert.pem"

username = ""
password = ""
profile = "UA-xxx"

Garb::Session.login(username, password, :secure => true)

class Report
  extend Garb::Resource

  metrics :unique_pageviews
  dimensions :page_path
  sort :unique_pageviews.desc
  
  filters do
    contains(:page_path, '/xxx')
  end
end

profile = Garb::Profile.first(profile)
options = {
  :start_date => (Date.today - 365*5),
  :end_date => Date.today
}
result = Report.results(profile, options)

result.each do |r|
  print "#{r.page_path} #{r.unique_pageviews}"
end
```
    

