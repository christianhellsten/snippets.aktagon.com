---
id: '974'
title: EXPLAIN ANALYZE with ActiveRecord
languages:
- ruby
tags:
---
ActiveRecord example:

```ruby
module ActiveRecord
  module ConnectionAdapters
    module PostgreSQL
      module DatabaseStatements
        def explain_analyze(arel, binds = [])
          sql = "EXPLAIN ANALYZE #{to_sql(arel, binds)}"
          PostgreSQL::ExplainPrettyPrinter.new.pp(exec_query(sql, "EXPLAIN", binds))
        end
      end
    end
  end
end

puts Job.where("slow = true").explain_analyze
...
```

Raw SQL example:

```ruby
puts ActiveRecord::Base.connection.select_all(sql).to_a.map { |x| x.fetch("QUERY PLAN") }.join("\n")
```

See: https://github.com/rails/rails/blob/b8787b92e7c94b8575118b5f259dd47b5de4772f/activerecord/lib/active_record/connection_adapters/postgresql/database_statements.rb#L7-L10

