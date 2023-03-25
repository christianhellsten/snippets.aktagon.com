---
id: '696'
title: I18n for ActiveRecord Model Attributes
languages:
- ruby
tags:
---
This code will translate the AR model's title attribute using Rails' I18n library:


```ruby
class Link < ActiveRecord::Base
  I18N_ATTRIBUTES = [ :title ]
  I18N_ATTRIBUTES.each do |attr|
    class_eval <<-EORUBY, __FILE__, __LINE__ + 1
      def #{attr}
        I18n.t(self[:#{attr}], default: self[:#{attr}])
      end
    EORUBY
  end
end
```
    

If a translation is not defined, the code will fall back to use the attribute's original value.

Example with translation defined:
---------------------------------

Translation file (config/locales/en.yml):


```ruby
en:
  views:
    index:
      title: Hello
```
    

Model code (app/models/link.rb):


```ruby
link.title = 'views.index.title'
# Uses string from config/locales/en.yml
link.title => "Hello"
```
    

Example without translation defined
-----------------------------------


```ruby
link = Link.new title: 'Hello'
# Fall back to specified value, because no translation is defined
link.title => "Hello"
```
    

