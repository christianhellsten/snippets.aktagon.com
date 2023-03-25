---
id: '250'
title: SEO optimized image URLs with the Paperclip Rails plugin
languages:
- ruby
tags:
---
Create config/initializers/paperclip.rb:


```ruby
# http://wiki.github.com/thoughtbot/paperclip/interpolations
Paperclip.interpolates :to_param do |attachment, style|
  attachment.instance.to_param
end
```
    

In the model:


```ruby
has_attached_file :image, 
                    :path => ":rails_root/public/images:to_param/:style/:basename.:extension",
                    :url => "/images:to_param/:style/:basename.:extension",
                    :styles => { :large  => "250x360#",
                                 :medium => "150x230#",
                                 :small  => "110x150#" }
```
    

Instead of URLs like:

/images/products/249/large/temp.jpg

You can get a URL based on, for example, a permalink as in the example above. In my case I get URLs like this:

/images/games/nintendo-wii/large/super-mario-galaxy.jpg

