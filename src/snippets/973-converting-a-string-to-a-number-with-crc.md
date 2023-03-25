---
id: '973'
title: Converting a string to a number with CRC
languages:
- ruby
tags:
---
CRC can be used to convert a string into a number:

```ruby
require 'zlib'
integer = Zlib.crc32('snippet')
=> 2518453461
Zlib.crc32('cat')
=> 2656977832
```

The CRC algorithm is normally used to detect changes or errors in large chunks of data.
