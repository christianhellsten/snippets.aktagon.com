---
id: '700'
title: Ruby and Ruby on Rails Time and Time Zones
languages:
tags:
---
## Checklist

* Parsing: What is the time zone of the input?
* Parsing: Use Time.zone.parse to parse user input, but first set Time.zone to the user's time zone.
* UI: What is the user's time zone?
* UI: Show the time in the user's time zone: https://github.com/github/time-elements
* Ruby: Time.now uses the operating system's time zone
* Ruby: Date.today uses the operating system's time zone
* Ruby: Time.parse uses the operating system's time zone
* Ruby: Use Range.cover? with time ranges and know how it differs from Range.include?
* Rails: Time.zone.now and Time.current uses Rails' time zone (config.time_zone in config/application.rb)
* Rails: Time.zone.today uses Rails' time zone
* Rails: Time.zone.parse uses Rails' time zone
* Database: Store time in UTC (without time zone information)
* Database: "BETWEEN a AND b" is inclusive
* Database: PostgreSQL's current_timestamp uses the database time zone (timezone in postgresql.conf)
* API: Use ISO 8601 format
* [Daylight savings](en.wikipedia.org/wiki/Daylight_saving_time)
* [Leap year](https://en.wikipedia.org/wiki/Leap_year)
* [Falsehoods](https://gist.github.com/timvisee/fcda9bbdff88d45cc9061606b4b923ca)
