---
id: '840'
title: Raw SQL queries with ActiveRecord's find_by_sql and select_all
languages:
- ruby
tags:
---
Raw SQL queries can be executed with ActiveRecord's find_by_sql and select_all methods.

If you have an ActiveRecord::Model use **find_by_sql**:

```ruby
sql = "select * from honey where bee = :bee offset :offset limit :limit"
honey = Honey.find_by_sql([ sql, bee: 'Russian honey bee', offset: 1000, limit: 10 ])
```

In this example find_by_sql will return instances of the Honey model. The bind variables can be given as parameters to the find_by_sql method.

The other option is to return the raw SQL results as an array of hashes using **select_all**:

```ruby
bee = ActiveRecord::Base.connection.quote('Russian honey bee')
offset = ActiveRecord::Base.connection.quote(1000)
limit = ActiveRecord::Base.connection.quote(10)
sql = "select * from honey where bee = #{bee} offset #{offset} limit #{limit}"
ActiveRecord::Base.connection.select_all(sql).to_a
```

You can also use select_value, select_all, and other methods with bind variables like this:

```ruby
def securities_value_for_quarter(quarter)
  sql = <<~SQL
    SELECT
      sum(value) * 1000
    FROM
      holdings
    WHERE
      quarter = $1 and company_id = $2
  SQL
  ActiveRecord::Base.connection.select_value(sql, 'SQL', [ bind_param(quarter), bind_param(id) ])
end

def bind_param(value)
  ActiveRecord::Relation::QueryAttribute.new(nil, value, ActiveRecord::Type::Value.new)
end
```

Make sure you sanitize and escape any input from end users.

References:

- https://edgeapi.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/DatabaseStatements.html#method-i-select_value
