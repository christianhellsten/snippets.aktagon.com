---
id: '198'
title: How to add a watermark to images using MiniMagick, attachment_fu and Ruby
languages:
- ruby
tags:
- keras
- tensorflow
- theano
---
Use this snippet to add a watermark to an image, after the image is uploaded:


```ruby
class Image
  .
  has_attachment ...
  .
  .
  after_attachment_saved do |record|    
    # Don't add watermarks to thumbnails
    if record.thumbnail.nil?
      full_path = File.join(RAILS_ROOT, 'public/', record.public_filename)
      
      img = MiniMagick::Image.from_file(full_path)
      
      width = img[:width]
      height = img[:height]
      
      if width > 150 && height > 150
        img.combine_options do |c|
          c.gravity 'SouthWest'
          # This is RAILS_ROOT/images/watermark.gif
          c.draw "image Over 0,0 0,0 \"images/watermark.gif\""
        end

        img.write(full_path)
        
      end
    end
    
  end
```
    

Note that after\_attachment\_saved is a callback added by attachment\_fu, use after\_save if you're not using attachment\_fu.

