---
id: '312'
title: Pluralization with Rails >2.2.1
languages:
- ruby
tags:
- bootstrap
- rails
- sass
- webpack
- webpacker
---
Rails 2.2.1 moved the Inflector class to the ActiveSupport module, so if you see this error you need to update your code:


```ruby
"uninitialized constant Inflector (NameError)"
```
    

The inflection rules are stored in config/initializers/inflections.rb:


```ruby
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'is', 'are'
  inflect.irregular 'person', 'people'

#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.uncountable %w( fish sheep )
end
```
    

Pluralization in views is done like this:


```ruby
pluralize(@users.size, 'person')
pluralize(@users.size, 'is')
```
    

Alternatively:


```ruby
pluralize(@users.size, 'person', 'people')
```
    

The documentation can be found [at api.rubyonrails.org](http://api.rubyonrails.org/classes/ActiveSupport/Inflector/Inflections.html).

