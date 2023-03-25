---
id: '313'
title: Ignoring columns with acts_as_versioned
languages:
- ruby
tags:
---

```ruby
def Model

  @@versioned_columns = [:title, :body, :rendered_body, :user_id]  
  acts_as_versioned :if_changed => @@versioned_columns

  def self.non_versioned_columns
      self.class.columns.collect(&:name) - @@versioned_columns
  end
end
```
    

