---
id: '742'
title: Calculating quarters in Ruby
languages:
- ruby
tags:
---
```ruby
require 'date'

class Date
  def quarter
    case month
    when 1, 2, 3 then 1
    when 4, 5, 6 then 2
    when 7, 8, 9 then 3
    when 10, 11, 12 then 4
    end
  end

  def start_of_previous_quarter
    end_of_previous_quarter.start_of_quarter
  end

  def previous_quarter
    start_of_quarter.prev_day
  end

  def next_quarter
    end_of_quarter.next_day.end_of_quarter
  end

  def start_of_quarter
    first_month = quarter * 3 - 2
    Date.new(year, first_month, 1)
  end

  def end_of_quarter
    last_month = quarter * 3
    Date.new(year, last_month, 1).next_month.prev_day
  end

  def quarters_between(other_date)
    current = self
    quarters = [current.end_of_quarter]
    while current < other_date
      current = current.advance(months: 3).end_of_quarter
      quarters << current
    end
    quarters
  end
end
```
    

Example:


```ruby
class DateTest < ActiveSupport::TestCase
  test "quarter" do
    assert_equal 1, Date.new(2020, 3, 1).quarter
    assert_equal 1, Date.new(2020, 3, 31).quarter
    assert_equal 2, Date.new(2020, 4, 1).quarter
    assert_equal 2, Date.new(2020, 6, 30).quarter
    assert_equal 3, Date.new(2020, 7, 1).quarter
    assert_equal 3, Date.new(2020, 9, 30).quarter
    assert_equal 4, Date.new(2020, 10, 1).quarter
    assert_equal 4, Date.new(2020, 12, 31).quarter
  end

  test "start_of_quarter" do
    assert_equal Date.new(2020, 1, 1), Date.new(2020, 3, 1).start_of_quarter
    assert_equal Date.new(2020, 1, 1), Date.new(2020, 3, 31).start_of_quarter
    assert_equal Date.new(2020, 4, 1), Date.new(2020, 4, 1).start_of_quarter
    assert_equal Date.new(2020, 4, 1), Date.new(2020, 6, 30).start_of_quarter
    assert_equal Date.new(2020, 7, 1), Date.new(2020, 7, 1).start_of_quarter
    assert_equal Date.new(2020, 7, 1), Date.new(2020, 9, 30).start_of_quarter
    assert_equal Date.new(2020, 10, 1), Date.new(2020, 12, 1).start_of_quarter
    assert_equal Date.new(2020, 10, 1), Date.new(2020, 12, 31).start_of_quarter
  end

  test "end_of_quarter" do
    assert_equal Date.new(2020, 3, 31), Date.new(2020, 1, 1).end_of_quarter
    assert_equal Date.new(2020, 3, 31), Date.new(2020, 3, 31).end_of_quarter
    assert_equal Date.new(2020, 6, 30), Date.new(2020, 4, 1).end_of_quarter
    assert_equal Date.new(2020, 6, 30), Date.new(2020, 6, 30).end_of_quarter
    assert_equal Date.new(2020, 9, 30), Date.new(2020, 7, 1).end_of_quarter
    assert_equal Date.new(2020, 9, 30), Date.new(2020, 9, 30).end_of_quarter
    assert_equal Date.new(2020, 12, 31), Date.new(2020, 10, 1).end_of_quarter
    assert_equal Date.new(2020, 12, 31), Date.new(2020, 12, 31).end_of_quarter
  end

  test "next_quarter" do
    assert_equal Date.new(2020, 6, 30), Date.new(2020, 1, 1).next_quarter
    assert_equal Date.new(2020, 6, 30), Date.new(2020, 3, 31).next_quarter
    assert_equal Date.new(2020, 9, 30), Date.new(2020, 4, 1).next_quarter
    assert_equal Date.new(2020, 9, 30), Date.new(2020, 6, 30).next_quarter
    assert_equal Date.new(2020, 12, 31), Date.new(2020, 9, 30).next_quarter
    assert_equal Date.new(2021, 3, 31), Date.new(2020, 10, 1).next_quarter
    assert_equal Date.new(2021, 3, 31), Date.new(2020, 12, 31).next_quarter
  end

  test "prev_quarter" do
    assert_equal Date.new(2019, 12, 31), Date.new(2020, 1, 1).previous_quarter
    assert_equal Date.new(2019, 12, 31), Date.new(2020, 3, 31).previous_quarter
    assert_equal Date.new(2020, 3, 31), Date.new(2020, 4, 1).previous_quarter
    assert_equal Date.new(2020, 3, 31), Date.new(2020, 6, 30).previous_quarter
    assert_equal Date.new(2020, 6, 30), Date.new(2020, 7, 1).previous_quarter
    assert_equal Date.new(2020, 6, 30), Date.new(2020, 9, 30).previous_quarter
    assert_equal Date.new(2020, 9, 30), Date.new(2020, 10, 1).previous_quarter
    assert_equal Date.new(2020, 9, 30), Date.new(2020, 12, 31).previous_quarter
  end
  
  test "quarters_between" do
    qtrs = Date.new(2019, 1, 1).quarters_between(Date.new(2020, 1, 1))
    assert_equal [ Date.new(2019, 3, 31), Date.new(2019, 6, 30), Date.new(2019, 9, 30), Date.new(2019, 12, 31), Date.new(2020, 3, 31) ], qtrs
  end
end
```
    
In Rails there's the built-in prev_quarter and next_quarter.
