---
id: '842'
title: Fetch the status of Postgres' streaming replication with ActiveRecord and Rails
languages:
- ruby
tags:
---
When using streaming replication you can use this code to fetch the number of bytes the slave is behind the master in applying changes to the WAL (write-ahead log):

```ruby
class SlaveDatabase < ApplicationRecord
  self.abstract_class = true
  # NOTE: Add slave entry to config/database.yml
  establish_connection :slave

  #
  # Returns the number of bytes the slave is behind the master in applying WAL updates.
  #
  def self.replication_delta
    # Returns, for example, 12/547C3A58 from the master
    current_master_wal = ActiveRecord::Base.connection.select_value("SELECT pg_current_wal_flush_lsn();")
    # Returns, for example, -7504582 from the slave
    delta = connection.select_value("SELECT #{connection.quote(current_master_wal)} - pg_last_wal_receive_lsn()")
    raise "pg_last_wal_receive_lsn returned null, see documentation for details" unless delta
    Integer(delta).abs
  end
end
```

Tested with version Postgres 10. Note that in version 10, pg_last_xlog_receive_location has been renamed to pg_last_wal_receive_lsn, and pg_current_xlog_flush_location has been renamed to pg_current_wal_flush_lsn.
