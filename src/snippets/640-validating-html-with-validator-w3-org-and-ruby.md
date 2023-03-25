---
id: '640'
title: Validating HTML with validator.w3.org and Ruby
languages:
- ruby
tags:
---

```ruby
require "net/http"

def validate(html)
  response = Net::HTTP.start("validator.w3.org") do |r|
    query = "output=json&fragment=" + CGI.escape(html)
    r.post2("/check", query)
  end
  if "Invalid" == response["x-w3c-validator-status"]
    File.open('/tmp/html-validation.html', 'w') { |f| f << html }
    JSON.parse(response.body)
  end
end

# List all validation errors
html = File.read('/tmp/html-validation.html')
if errors = validate(html)
  puts errors
end
```
    

