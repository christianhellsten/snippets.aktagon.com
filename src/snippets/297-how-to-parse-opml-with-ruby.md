---
id: '297'
title: How to parse OPML with Ruby
languages:
- ruby
tags:
- pitr
- postgresql
- replication
- standby
- streaming
---
This example demonstrates how to parse OPML with Ruby.

First install the gem.


```ruby
gem install opml
```
    

Then run this code:


```ruby
require 'pp'
require 'rubygems'
require 'opml'

opml = Opml.new(File.read('opml.xml'))
pp opml

opml.outlines[0].attributes['xml_url']
opml.outlines[0].attributes['html_url']
opml.outlines[0].attributes['title']
```
    

