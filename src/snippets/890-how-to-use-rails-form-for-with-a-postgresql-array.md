---
id: '890'
title: How to use Rails' form_for with a PostgreSQL array
languages:
- ruby
tags:
---
Using Rails' form_for with a PostgreSQL array, for example, user roles can be done as follows:

Migration:

```ruby
class CreateProjectMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :project_members, id: :uuid do |t|
      ...
      t.string :roles, array: true, default: []
```

Model:

```ruby
class ProjectMember < ApplicationRecord
  validate :validate_roles
  ROLES = %w[administrator collaborator].freeze

  def validate_roles
    return if roles.is_a?(Array) && roles.all? { |d| ROLES.include?(d) }

    errors.add(:roles, :invalid)
  end
end
```

View (slim-lang):

```ruby
= form @project_member do |f|
  .form-group
    = f.label :roles, 'Roles'
    = f.check_box :roles, { label: 'Administrator', multiple: true }, 'administrator', nil
    = f.check_box :roles, { label: 'Collaborator', multiple: true }, 'collaborator', nil
```

Controller:

```ruby
class ProjectMembersController < ApplicationController
  ...
  def update
    if @project_member.update(project_member_params)
    ...
  end

  def project_member_params
    params.require(:project_member).permit(roles: [])
  end
```

Note that if you have a "has_many through" relationship, instead of a PostgreSQL array, you can simply use: 

```ruby
= f.collection_check_boxes(:locale_ids, Locale.all, :id, :language) do |b|
  b.check_box
```

Reference:
https://apidock.com/rails/v6.0.0/ActionView/Helpers/FormOptionsHelper/collection_check_boxes
