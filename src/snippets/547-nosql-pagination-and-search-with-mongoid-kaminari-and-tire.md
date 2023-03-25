---
id: '547'
title: NoSQL, Pagination and Search with Mongoid, Kaminari and Tire
languages:
- ruby
tags:
- breakpoint
- debug
- pry
- python
---
This example uses Mongoid, Kaminari and Tire (ElasticSearch):


```ruby
require 'kaminari/models/mongoid_extension'

class Product
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  index :application_id, :unique => true

  # NOTE Best to include after Mongoid
  include Tire::Model::Search
  include Tire::Model::Callbacks

  include Kaminari::MongoidExtension::Criteria
  include Kaminari::MongoidExtension::Document
end
```
    

Now you can paginate and search all you want:


```ruby
# Search and paginate
Product.tire.search :page => 1, :per_page => 100, :load => true do
    query             { string "Ho ho" }
    #sort              { by     :rating, 'desc' }
end
# Paginate
Product.page(1).per(100)
```
    

Gotchas
-------

\* Use Model.tire.search/index, instead of Model.search which conflicts with Mongoid's index/search methods.
\* Use :load =&gt; true to return an array containing the model you're searching for instead of Tire::Result::Items.
\* Use :per\_page and :page with Model.tire.search, not the page/per methods.
\* Mongoid queries are not the same as ActiveRecord queries, see <http://mongoid.org/docs/querying/criteria.html#where>
\* MongoDB URL <http://localhost:28017/>
\* ElasticSearch URL <http://localhost:9200/products/_mapping>
\* Boolean queries are difficult <https://gist.github.com/1263816>

