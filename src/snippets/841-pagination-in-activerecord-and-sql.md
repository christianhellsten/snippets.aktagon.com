---
id: '841'
title: Pagination in ActiveRecord and SQL
languages:
- ruby
- slim
tags:
---
See https://github.com/christianhellsten/arrr-pagination

How to do pagination in ActiveRecord and SQL without any external dependencies.

Code:

```ruby
class Pagination
  PER_PAGE ||= 10
  def self.call(relation:, page: 0, per_page: PER_PAGE)
    page = page.to_i
    per_page = per_page.to_i
    offset = page*per_page
    array = relation.offset(offset).limit(per_page+1).to_a
    row_count = relation.count
    page_count = (row_count.to_f / per_page.to_f).ceil
    has_previous_page = page > 0
    has_next_page = array.size > per_page
    pagination = OpenStruct.new(
      page: page,
      page_count: page_count,
      previous_page: has_previous_page ? page - 1 : nil,
      next_page: has_next_page ? page + 1 : nil
    )
    array = array[0..-2] if has_next_page
    [ array, pagination ]
  end
end
```

Example:

```ruby
let(:relation) { Measurement.order("created_at DESC") }

it "paginates" do
  measurements, pagination = Pagination.call(relation: relation, per_page: 1, page: 0)
  assert_equal 1, measurements.size
  assert_equal OpenStruct.new(page: 0, page_count: 1, previous_page: nil, next_page: nil), pagination
end
```

View:

```slim
- if @pagination.previous_page || @pagination.next_page
  .pagination
    ul
      - if @pagination.previous_page
        li
          a href=url_for(params.merge(page: nil)) ‹
        li
          a href=url_for(params.merge(page: @pagination.previous_page)) = t('previous')
        - ([0, @pagination.page-4].max..@pagination.page-1).each do |page|
          li
            a href=url_for(params.merge(page: page)) #{page+1}
      - else
        li
          span.muted ‹
        li
          span.muted = t('previous')
      li
        span.muted #{t('page')} #{@pagination.page + 1}
      - if @pagination.next_page
        - (@pagination.page+1..[@pagination.page_count-1, @pagination.page+4].min).each do |page|
          li
            a href=url_for(params.merge(page: page)) #{page+1}
        li
          a href=url_for(params.merge(page: @pagination.next_page)) = t('next')
        li
          a href=url_for(params.merge(page: @pagination.page_count - 1)) ›
      - else
        li
          span.muted = t('next')
```

