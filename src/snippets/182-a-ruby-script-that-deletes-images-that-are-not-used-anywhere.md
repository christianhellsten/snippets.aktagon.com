---
id: '182'
title: A Ruby script that deletes images that are not used anywhere
languages:
- ruby
tags:
---

```ruby
Dir.glob("**/*.{jpg,gif,jpeg,png}").sort.each do |image|

  name   = File.basename(image)
  in_use = false
  
  Dir.glob("**/*.{erb,css,js,html,htm}").each do |file|
    contents = File.read(file)

    in_use = contents.include?(name)
    
    break if in_use
  end

  if !in_use
    puts "Deleting '#{image}'"
    File.delete(image)
  end
end
```
    

