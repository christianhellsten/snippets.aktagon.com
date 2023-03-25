---
id: '845'
title: Repeatable-read vs read-committed example in Rails / ActiveRecord
languages:
- ruby
tags:
---
```ruby
ActiveRecord::Base.logger = Logger.new(STDOUT)

require "test/unit/assertions"
include Test::Unit::Assertions

class Cust1 < ActiveRecord::Base
  self.table_name = "customers"
end

class Cust2 < ActiveRecord::Base
  self.table_name = "customers"
end

# NOTE: Two separate connections
Cust1.establish_connection :development
Cust2.establish_connection :development

Cust1.find_by(username: 'z@localhost').try(:delete)

c = Cust1.create!(first_name: 'Putin', last_name: 'jebus', password_digest: 'abcdef12345', username: 'z@localhost')

case ENV['isolation']
when 'repeatable_read'
  #
  # NOTE: Repeatable-read isolation
  #
  # This level is different from Read Committed in that a query in a repeatable
  # read transaction sees a snapshot as of the start of the transaction, not as
  # of the start of the current query within the transaction. Thus, successive
  # SELECT commands within a single transaction see the same data, i.e., they do
  # not see changes made by other transactions that committed after their own
  # transaction started.
  #
  puts "Repeatable read"
  assert ActiveRecord::Base.connection.transaction_isolation_levels.include?(:repeatable_read)
  Cust1.transaction(isolation: :repeatable_read) do
    c.reload
    Cust2.find(c.id).update_attributes(first_name: 'Stalin')
    c.reload
    assert_equal 'Putin', c.first_name
  end
  c.reload
  assert_equal 'Stalin', c.first_name
else
  #
  # NOTE: Read-committed isolation
  #
   # Read Committed is the default isolation level in PostgreSQL. When a
  # transaction uses this isolation level, a SELECT query (without a FOR
  # UPDATE/SHARE clause) sees only data committed before the query began; it
  # never sees either uncommitted data or changes committed during query
  # execution by concurrent transactions. In effect, a SELECT query sees a
  # snapshot of the database as of the instant the query begins to run.
  # However, SELECT does see the effects of previous updates executed within
  # its own transaction, even though they are not yet committed. Also note that
  # two successive SELECT commands can see different data, even though they are
  # within a single transaction, if other transactions commit changes after the
  # first SELECT starts and before the second SELECT starts.
  #
  puts "Read committed"
  Cust1.transaction do
    c.reload
    Cust2.find(c.id).update_attributes(first_name: 'Stalin')
    c.reload
    assert_equal 'Stalin', c.first_name
  end
  c.reload
  assert_equal 'Stalin', c.first_name
end
```

See
- https://www.postgresql.org/docs/current/static/transaction-iso.html#MVCC-ISOLEVEL-TABLE
- https://github.com/rails/rails/blob/master/activerecord/test/cases/transaction_isolation_test.rb

For transactions in general, see:
- https://github.com/rails/rails/blob/master/activerecord/lib/active_record/transactions.rb
- https://gist.github.com/jcasimir/1098368
