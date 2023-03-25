---
id: '651'
title: How to Visualize a Rails Application
languages:
- ruby
tags:
---
Visualizing a Rails project is easy with:
\* [Railroady](https://github.com/preston/railroady)
\* [Rails-ERD](http://rails-erd.rubyforge.org/)


```ruby
# Generate ERD diagram
rake erd filetype=dot
dot -Tpng erd.dot > erd.png

# Generate models diagram
railroady -M -o models.dot
dot -Tpng models.dot > models.png

# Generate controllers diagram
railroady -C -o controllers.dot
neato -Tpng controllers.dot > controllers.png

# Generate AASM state diagram
railroady -A -o states.dot
dot -Tpng states.dot > controllers.png
```
    

