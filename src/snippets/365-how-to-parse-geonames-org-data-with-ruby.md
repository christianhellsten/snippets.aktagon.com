---
id: '365'
title: How to parse geonames.org data with Ruby
languages:
- ruby
tags:
---

```ruby
require 'rubygems'
require 'ostruct'
require 'time'

class GeoName < OpenStruct
end  

class GeoNames
  class << self
    def parse(file)
      File.new(file).each_line do |line|
        g = GeoName.new
        s = line.chomp.split("\t")
        g.geonameid = s[0]
        g.name = s[1]
        g.asciiname = s[2]
        g.alternatenames = s[3]
        g.latitude = s[4]
        g.longitude = s[5]
        g.feature_class = s[6]
        g.feature_code = s[7]
        g.country_code = s[8]
        g.cc2 = s[9]
        g.admin1 = s[10]
        g.admin2 = s[11]
        g.admin3 = s[12]
        g.admin4 = s[13]
        g.population = s[14]
        g.elevation = s[15]
        g.gtopo30 = s[16]
        g.timezone = s[17]
        g.modification_date = Time.parse(s[18])
      
        yield g
      end
    end
  end
end

file = "geonames/features.txt"

GeoNames.parse(file) do |place|
  p place.geonameid
  break
end
```
    

Inspired by this [article](http://www.hokstad.com/using-sequel-and-ruby-to-import-the-geonames-database.html)

