---
id: '497'
title: SEO optimizing CarrierWave URLs
languages:
- apacheconf
tags:
- cron
- crontab
- docker
- docker-compose
- env
- environment
---

```apacheconf
class ProductImageUploader < CarrierWave::Uploader::Base

  def store_dir
    "product"
  end

  def filename
    ext = File.extname(original_filename) if original_filename
    "#{model.name.parameterize}#{ext}"
  end
end
```
    

