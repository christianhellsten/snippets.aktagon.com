---
id: '471'
title: A custom Swedish time_ago_in_words implementation
languages:
- ruby
tags:
---
This is an easily customizable time\_ago\_in\_words implementation in Swedish that will produce this output:


```ruby
< 5 minuter
< 45 minuter
< 1 timme
> 2 timmar
> 1 dag, 2 timmar
20 April 2010 (if more than 31 days ago)
```
    

The code:


```ruby
class Time
  def time_ago_in_words
    words = ''
    timestamp = self
    if timestamp
      time_until = (Time.now.to_datetime - timestamp.to_datetime)
      days = time_until.to_i
      hours, minutes, seconds, frac = Date.day_fraction_to_time(time_until)
      hours = hours % 24

      if days == 0
        if hours < 1
          words = case minutes
            when 0..4 then "< 5 minuter"
            when 5..14 then "< 15 minuter"
            when 15..29 then "< 30 minuter"
            when 30..44 then "< 45 minuter"
            when 45..59 then "< 1 timme"
          end
        else
          words = "> #{hours} #{'timme'.inflect(hours)}"
        end
      elsif days < 31
        words = "> #{days} #{'dag'.inflect(days)}"
        if hours > 0
          words += ", #{hours} #{'timme'.inflect(hours)}"
        end
      else
        words = timestamp.l(:format => :daymonthyear)
      end
    end
    words
  end
end
```
    

You'll need this for inflections:


```ruby
class String
  def inflect(count)
    count > 1 ? ActiveSupport::Inflector.pluralize(self) : self
  end
end
```
    

Add this to config/locales/sv-SE.yml for localizing the date in Swedish:


```ruby
time:
    formats:
      daymonthyear: "%d %B %Y"
```
    

Add this to config/initializers/inflections.rb for Swedish inflections:


```ruby
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'dag', 'dagar'
  inflect.irregular 'vecka', 'veckor'
  inflect.irregular 'månad', 'månader'
  inflect.irregular 'timme', 'timmar'
  inflect.irregular 'minut', 'minuter'
  inflect.irregular 'sekund', 'sekunder'
end
```
    

