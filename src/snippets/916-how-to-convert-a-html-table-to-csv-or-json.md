---
id: '916'
title: How to convert a HTML table to CSV or JSON
languages:
- ruby
tags:
---
```ruby
require 'nokogiri'
require 'net/http'
require 'csv'
require 'json'

url = 'http://site/html.table'
uri = URI(url)
response = Net::HTTP.get(uri)

doc = Nokogiri::HTML(response)
table = doc.xpath('//table//tr').map do |row|
  row.xpath('td').map do |cell|
    cell.text
  end
end
puts JSON.pretty_generate(table)
```
