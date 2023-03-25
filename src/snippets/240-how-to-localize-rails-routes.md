---
id: '240'
title: How to localize Rails routes
languages:
- css
tags:
- elixir
- order
- '"pattern matching"'
---
I forget this all the time:


```css
map.resources :products, :as => 'productos', :path_names => { :new => 'nuevo', :edit => 'editar' }
```
    

[Documented here....](http://api.rubyonrails.org/classes/ActionController/Resources.html)

