---
id: '147'
title: Scraping Yahoo! Finance with Ruby and Hpricot
languages:
- css
tags:
---
This code extracts the numbers from the Fund operations table on the BLV fund's [Profile page](http://finance.yahoo.com/q/pr?s=BLV) at Yahoo! Finance.


```css
require 'rubygems'
require 'hpricot'
require 'open-uri'

page = Hpricot(open('http://finance.yahoo.com/q/pr?s=BLV'))

fund_operations = []
page.search( "//table[@class='yfnc_datamodoutline1']" ).each do |row|
  row.search( "//td[@class='yfnc_datamoddata1']").each do |data|
    fund_operations << data.inner_html
  end
end

pp fund_operations
```
    

The output from this script is:


```css
["N/A", "N/A", "55%", "72", "85.05M", "1.71B"]
```
    

Note that you could also use Scrubyt for this. Here's a snippet that explains how to use Scrubyt to scrape web pages: [Scraping Google search results with Scrubyt and Ruby](http://snippets.aktagon.com/tags/218-scrubyt)

