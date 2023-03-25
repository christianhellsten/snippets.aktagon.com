---
id: '635'
title: Frozen ActiveRecord Attributes Validator
languages:
- ruby
tags:
---
Disallows update of frozen attributes:


```ruby
#
# Validates that an attribute cannot be changed after object has been created.
#
# Usage:
#   validates :user_id, :token, frozen_attribute: true, allow_blank: true
#
# allow_blank: set to true to allow setting nil attributes
#
class FrozenAttributeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    changed = record.send("#{attribute}_changed?")
    was_not_blank = if options[:allow_blank]
                      !(record.send("#{attribute}_was").blank? && value.present?)
                    else
                      true
                    end
    if record.persisted? && changed && was_not_blank
      record.errors.add(attribute, 'is frozen')
    end
    true
  end
end
```
    

Put the thing in app/validators/frozen\_attribute\_validator.rb. Use it like this:


```ruby
class Horse < ActiveRecord::Base
  validates :user_id, :token, frozen_attribute: true, allow_blank: true
```
    

