---
id: '519'
title: How to add OpenSearch to your Rails app
languages:
- ruby
tags:
- cron
- dockerfile
- pid
- stderr
- stdout
---
Add an action:


```ruby
def opensearch
    # fixes Firefox "Firefox could not download the search plugin from:"
    response.headers["Content-Type"] = 'application/opensearchdescription+xml'
    render :layout => false
end
```
    

Create the template **opensearch.erb**:


```ruby
<?xml version="1.0" encoding="UTF-8"?> 
 
<OpenSearchDescription xmlns="http://a9.com/-/spec/opensearch/1.1/"> 
  <ShortName>YerWebberSite</ShortName> 
  <Description>YerWebberSite search</Description> 
  <Tags>secks, drogs, rocken roll</Tags> 
  <InputEncoding>UTF-8</InputEncoding> 
  <Image width="16" height="16">http://yerwebbersite.com/favicon.ico</Image> 
  <moz:SearchForm "http://yerwebbersite.com/searchFormer"/>
  
  <Url type="text/html"
    template="http://yerwebbersite.com/searchFormer?q={searchTerms}&amp;utm_source=opensearch&amp;utm_medium=search&amp;utm_campaign=opensearch"/> 
       
</OpenSearchDescription>
```
    

Add the autodiscovery tag inside the head tag:


```ruby
<link href='/opensearch.xml' rel='search' title='YerWebberSite search' type='application/opensearchdescription+xml'>
```
    

Problems? Read the [documentation and troubleshooting tips](https://developer.mozilla.org/en/creating_opensearch_plugins_for_firefox).

