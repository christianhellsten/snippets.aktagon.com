---
id: '345'
title: Crop + Gravity + Paperclip
languages:
- ruby
tags:
---
By default the cropping is weighted at the center of the Geometry. I want it to be north west, so I came up with this dirty hack for setting the gravity to north west:


```ruby
module Paperclip
 
   # Defines the geometry of an image.
  class Geometry

     def cropping dst, ratio, scale
       if ratio.horizontal? || ratio.square?
         #"%dx%d+%d+%d" % [ dst.width, dst.height, 0, (self.height * scale - dst.height) / 2 ]
         "%dx%d+%d+%d" % [ dst.width, dst.height, 0, 0 ]
       else
         #"%dx%d+%d+%d" % [ dst.width, dst.height, (self.width * scale - dst.width) / 2, 0 ]
         "%dx%d+%d+%d" % [ dst.width, dst.height, 0, 0 ]
       end
     end
  end
end
```
    

