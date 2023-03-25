---
id: '925'
title: WHERE NOT EXISTS in ActiveRecord / Rails
languages:
- ruby
tags:
---
```ruby
Job.where(
  'NOT EXISTS (:people)',
  persons: People.select('1').where('jobs.id = people.job_id')
)
```
