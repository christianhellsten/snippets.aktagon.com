---
id: '730'
title: Finnish SSID/HETU generator in Ruby
languages:
- ruby
tags:
---

```ruby
module Ssid
  module Fake
    #
    # Generates fake Finnish SSIDs (HETU).
    #
    # Original Python version:
    # https://gist.github.com/puumuki/11172310
    #
    class Finnish
      CHECK_KEYS = "0123456789ABCDEFHJKLMNPRSTUVWXY"
      CENTURIES = { '18' => '+',
                    '19' => '-',
                    '20' => 'A' }
      def self.generate(start_year=1800, end_year=2014)
        year = start_year + rand(start_year - end_year)
        month = 1 + rand(12)
        day = 1 + rand(days_in_month(year, month))
        century_sep = CENTURIES[year.to_s[0..1]]
        order_num = 2 + rand(889)
        check_number = "%02d%02d%s%03d" % [ day, month, year.to_s[0..1], order_num ]
        check_number_index = check_number.to_i % 31
        key = CHECK_KEYS[check_number_index]
        "%02d%02d%s%s%03d%s" % [ day, month, year.to_s[0..1], century_sep, order_num, key ]
      end

      private

      def self.days_in_month(year, month)
        (Date.new(year, 12, 31) << (12-month)).day
      end
    end
  end
end
```
    

