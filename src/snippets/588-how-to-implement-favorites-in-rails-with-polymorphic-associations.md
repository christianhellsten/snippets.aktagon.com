---
id: '588'
title: How to implement favorites in Rails with polymorphic associations
languages:
- ruby
tags:
---
The code:


```ruby
class User < ActiveRecord::Base
  has_many :favorites
  has_many :favorite_feeds, :through =>  :favorites, :source => :favorable, :source_type => "Feed"
  has_many :favorite_entries, :through =>  :favorites, :source => :favorable, :source_type => "Entry"
end

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorable, :polymorphic => true
  attr_accessible :user, :favorable
end

class Feed < ActiveRecord::Base
  has_many :favorites, :as => :favorable
  has_many :fans, :through => :favorites, :source => :user
end

class Entry < ActiveRecord::Base
  has_many :favorites, :as => :favorable
  has_many :fans, :through => :favorites, :source => :user
end
```
    

The migration:


```ruby
create_table :favorites do |t|
  t.references :user
  t.references :favorable
  t.string :favorable_type
end

add_index :favorites, [:user_id, :favorable_id, :favorable_type], unique: true
```
    

The test:


```ruby
user.favorite_entries
user.favorite_feeds

feed.fans
entry.fans
```
    

The end.

