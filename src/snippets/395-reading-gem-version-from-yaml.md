---
id: '395'
title: Reading gem version from YAML
languages:
- ruby
tags:
---
From Jekyll:


```ruby
module YerGem
  def self.version
    yml = YAML.load(File.read(File.join(File.dirname(__FILE__), *%w[.. VERSION.yml])))
    "#{yml[:major]}.#{yml[:minor]}.#{yml[:patch]}"
  end
end
```
    

