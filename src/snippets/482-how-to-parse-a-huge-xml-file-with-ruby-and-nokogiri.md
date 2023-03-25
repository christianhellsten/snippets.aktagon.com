---
id: '482'
title: How to parse a huge XML file with Ruby and Nokogiri
languages:
- ruby
tags:
---

```ruby
require 'nokogiri'

class XMLHandler < Nokogiri::XML::SAX::Document
  def start_element(name, attrs = [])
    puts "start: #{name}"
  end

  def end_element(name)
    puts "end: #{name}"
  end
end

parser = Nokogiri::XML::SAX::Parser.new(XMLHandler.new)
parser.parse_file(ARGV[0])
# don't try to use 
#parser.parse(File.read(ARGV[0]))
```
    

See the [documentation for Sax::Document for details](http://nokogiri.org/Nokogiri/XML/SAX/Document.html)

