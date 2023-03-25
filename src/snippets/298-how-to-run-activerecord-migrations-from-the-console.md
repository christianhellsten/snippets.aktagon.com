---
id: '298'
title: How to run ActiveRecord migrations from the console
languages:
- ruby
tags:
---
There are multiple ways of running migrations from the console. This might be the easiest one to remember:


```ruby
irb ActiveRecord::Schema
add_index :followers, [:leader_id, :follower_id], :unique => true
```
    

You can also paste the migration code into the console window:


```ruby
class ModifyRating < ActiveRecord::Migration
  def self.up
    change_column :products, :rating, :decimal, :precision => 5, :scale => 3
  end

  def self.down
  end
end
```
    

Run the migration by typing **ModifyRating.up**.

