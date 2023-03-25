---
id: '891'
title: Optimistic locking in Rails
languages:
- ruby
- slim
tags:
---
This code is an adaptation of the code found in this Railscasts article:
http://railscasts.com/episodes/59-optimistic-locking-revised?view=asciicast

app/models/concerns/optimistic_locking.rb

```ruby
module OptimisticLocking
  extend ActiveSupport::Concern

  included do
    validate :handle_conflict, on: :update
  end

  def original_updated_at
    @original_updated_at || updated_at.to_f
  end
  attr_writer :original_updated_at

  def handle_conflict
    return unless @conflict || updated_at.to_f > original_updated_at.to_f

    @conflict = true
    # By setting original_updated_at to nil the edit conflict is ignored on a second form submit
    @original_updated_at = nil

    errors.add :base, I18n.t('activerecord.edit_conflict.message')
    changes.each do |attribute, values|
      errors.add(
        attribute,
        I18n.t('activerecord.edit_conflict.was', value: values.first)
      )
    end
  end
end
```

app/models/project.rb

```ruby
class Project < ApplicationRecord
  include OptimisticLocking
```


app/views/_edit_conflict.slim

```slim
- object.errors[:base]&.each do |error|
  p.text-danger
    = icon('fas', 'exclamation-circle')
    =< error
```

app/views/projects/_form.slim

```slim
= form @project do |f|
  = render '/edit_conflict', object: @project
  = f.hidden_field :original_updated_at
  = f.text_field :name, class: 'form-control'
  = form_buttons(f, @project)
```
