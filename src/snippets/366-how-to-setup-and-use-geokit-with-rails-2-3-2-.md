---
id: '366'
title: 'How to setup and use GeoKit with Rails 2.3.2 '
languages:
- ruby
tags:
---
Install the GeoKit gem and the Rails plugin:


```ruby
sudo gem install geokit
script/plugin install git://github.com/andre/geokit-rails.git
```
    

Edit config/environment.rb:


```ruby
Rails::Initializer.run do |config|
  config.gem "geokit"
end
```
    

Generate a model and migration file with script/generate model Place:


```ruby
class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name

      t.string :external_id
      t.string :external_type

      t.decimal :latitude,  :precision => 15, :scale => 10
      t.decimal :longitude, :precision => 15, :scale => 10

      t.timestamps
    end

    add_index :places, :latitude
    add_index :places, :longitude
    add_index :places, [:latitude, :longitude]
  end

  def self.down
    drop_table :places
  end
end
```
    

Configure GeoKit:


```ruby
class Place < ActiveRecord::Base
  acts_as_mappable :default_units => :kms, 
                   :default_formula => :sphere, 
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
end
```
    

Use your GeoKit enabled model:


```ruby
Place.find_within(105, :origin => Place.last)
```
    

