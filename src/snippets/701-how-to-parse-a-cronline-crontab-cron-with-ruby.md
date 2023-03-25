---
id: '701'
title: How to parse a cronline/crontab/cron with Ruby
languages:
- ruby
tags:
---
You can use the rufus-scheduler gem to parse cronline/crontab/cron with Ruby.

Gemfile:


```ruby
gem 'rufus-scheduler'
```
    

Example:


```ruby
require 'rufus/scheduler/cronline'
cron = Rufus::Scheduler::CronLine.new("00 00 1 * *") # 00:00 every first day of the month
#
next_time = cron.next_time(Time.current)
previous_time = cron.previous_time(Time.current)
```
    

rufus-scheduler's cronline implementation:
<https://github.com/jmettraux/rufus-scheduler/blob/master/lib/rufus/scheduler/cronline.rb>

See tests for details and syntax:
<https://github.com/jmettraux/rufus-scheduler/blob/master/spec/cronline_spec.rb>

[Cron configuration examples](http://snippets.aktagon.com/snippets/144-scheduling-jobs-to-run-daily-weekly-or-monthly-with-cron).

