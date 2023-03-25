---
id: '179'
title: Geolocation with MaxMind's GeoIP and the geoip-city RubyGem
languages:
- ruby
tags:
- postgres
- xbrl
- xml
- xpath
---
Install GeoIP library
---------------------


```ruby
wget http://www.maxmind.com/download/geoip/api/c/GeoIP.tar.gz
tar -zxvf GeoIP.tar.gz
cd GeoIP
./configure --prefix=/opt/GeoIP
make && sudo make install
```
    

Install the geoip-city gem
--------------------------


```ruby
gem install geoip_city -- --with-geoip-dir=/opt/GeoIP
```
    

Test the bindings
-----------------


```ruby
curl -O http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gunzip GeoLiteCity.dat.gz
```
    

Fire up IRB and try the following code:


```ruby
require 'rubygems'
require 'geoip_city'
db = GeoIPCity::Database.new('GeoLiteCity.dat')
result = db.look_up('192.143.34.23')
p result
```
    

Another option is to use hostip.info's database, as described in [this article](http://blog.hungrymachine.com/2007/10/22/super-fast-ip-to-lat-lng-in-rails).

Create a wrapper
----------------


```ruby
require 'rubygems'
require 'geoip_city'
require 'ostruct'

class Location < OpenStruct
end

class GeoIP
  class << self
    DB = GeoIPCity::Database.new('GeoLiteCity.dat')

    def lookup(ip)
      if result = DB.look_up(ip)
        location = Location.new

        #
        # {:country_code=>"FR", :country_code3=>"FRA", :country_name=>"France", :latitude=>46.0, :longitude=>2.0}
        #
        result.each do |key, val| 
          location.send "#{key}=", val
        end
      end

      location
    end
  end
end
```
    

Add some Rails caching
----------------------

Combined with the above code this will give you cached IP lookups:


```ruby
class GeoIP

  class << self
    def lookup_with_caching(ip)
      Rails.cache.fetch(ip, :expires_in => 1.month) do 
        lookup_without_caching(ip)
      end
    end

    alias_method_chain :lookup, :caching
  end
end
```
    

Alternatives
------------

If you're unable to install the C extension you might want to have a look at the geoip gem, which is a pure Ruby library that can read the MaxMind's geoip database. It's slower but easier to install: <http://geoip.rubyforge.org/>

