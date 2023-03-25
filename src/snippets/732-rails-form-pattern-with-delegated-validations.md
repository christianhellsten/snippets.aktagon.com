---
id: '732'
title: Rails Form Pattern With Delegated Validations
languages:
- ruby
tags:
---
Where do you put validations when you implement the Form pattern in Rails:

-   all in the model?
-   all in the form?
-   both in the model and form? This is a bad idea because you have to keep both model and form validations in sync.

This example defines all validations in the model, i.e. validation errors and form helpers work without additional code.


```ruby
#
# Form object wrapper for all models created when creating a new event.
#
class CreateEventForm
  # Rails 4+
  include ActiveModel::Model
  # Rails 3
  #extend ActiveModel::Naming
  #include ActiveModel::Conversion
  #include ActiveModel::Validations

  attr_accessor :event, :calendar
  delegate :id, :persisted?, to: :event

  def initialize(attributes = {})
    @event = Event.new
    @calendar = Calendar.new
    attributes.each do |key, value|
      public_send("#{key}=", value)
    end
    setup_associations
  end

  #
  # Save the event and all related models.
  #
  def save
    if valid?
      ActiveRecord::Base.transaction do
        event.save!
        calendar.save!
      end
   else
     false
    end
  end

  def self.model_name
    Event.model_name
  end

  def event_attributes=(attributes)
    event.attributes = attributes
  end

  def calendar_attributes=(attributes)
    calendar.attributes = attributes
  end

  def valid?
    valid = super
    # errors.base(:validation_error) unless valid_children?
    valid && valid_children?
  end

  private

  def valid_children?
    [ event, calendar ].map(&:valid?).all? { |valid| valid == true }
  end

  def setup_associations
    calendar.event = event
  end
end
```
    

View example:


```ruby
<%= simple_form_for @form do |f| # @form = CreateEventForm.new %>
...
f.simple_fields_for :calendar do |calendar|
end
f.simple_fields_for :event do |event|
end
...
<% end %>
```
    

Note, instead of form objects you can always use accepts\_nested\_attributes\_for. However, why should the view define what the model should look like? accepts\_nested\_attributes\_for is a similar hack as the deprecated attr\_accessible.

