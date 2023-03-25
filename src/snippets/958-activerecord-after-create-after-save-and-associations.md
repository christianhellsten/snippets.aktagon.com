---
id: '958'
title: ActiveRecord after_create/after_save and associations
languages:
- ruby
tags:
---
The order of ActiveRecord callbacks matter when, for example, using associations (e.g. has_many).

For example, the calculate_doors hook will be called before the associations are saved to the database if you use car.doors.build(name: :backdoor):

```ruby
class Car < ApplicationRecord
  after_create :calculate_doors
  has_many :doors
```

This can lead to subtle errors.

Changing the order will fix the issue:

```ruby
class Car < ApplicationRecord
  has_many :doors
  after_create :create_doors
```

Tested with Rails 6.1. Other versions might work differently.

See https://api.rubyonrails.org/classes/ActiveRecord/AutosaveAssociation.html for details:

> Placing your callbacks after associations is usually a good practice.
