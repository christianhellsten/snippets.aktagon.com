---
id: '726'
title: How to find the I18n key and more for ActiveRecord models
languages:
- ruby
tags:
---
Use ActiveModel's model\_name method to find


```ruby
User.model_name
User.i18n_scope # => :activerecord
User.model_name.i18n_key # => :user
User.model_name.route_key # => :user
User.model_name.partial_path # => users/user

# Find full name
klass = User
attribute_name = 'name'
puts "#{klass.i18n_scope}.attributes.#{klass.model_name.i18n_key}.#{attribute_name}"
=> activemodel.attributes.user.name

# Find all translations
I18n.backend.send(:translations)[:en][:activemodel][:attributes]
```

See Rails' source code (ActiveModel::Name, etc) for details on this complete mess:

-  https://github.com/rails/rails/blob/master/activemodel/lib/active_model/naming.rb
-  https://github.com/rails/rails/blob/4-2-stable/activemodel/lib/active_model/errors.rb#L412
- https://github.com/rails/rails/blob/4-2-stable/activemodel/lib/active_model/translation.rb

If all else fails you can try to find the correct key by debugging the human_attribute_name method with, e.g, pry:

```ruby
User.method(:human_attribute_name).source_location
[
    [0] ".../gems/activemodel-4.2.7.1/lib/active_model/translation.rb",
]
```
