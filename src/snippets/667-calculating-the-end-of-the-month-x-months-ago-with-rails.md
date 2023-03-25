---
id: '667'
title: Calculating the end of the month, x months ago, with Rails
languages:
- ruby
tags:
---
Last day of month, 12 months ago:


```ruby
(Time.now.beginning_of_month - 12.months).end_of_month
```
    

Rails' "months.ago" is intelligent enough to use exact amount of days.

