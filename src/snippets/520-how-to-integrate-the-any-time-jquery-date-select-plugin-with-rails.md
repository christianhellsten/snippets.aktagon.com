---
id: '520'
title: How to integrate the Any+Time jQuery date-select plugin with Rails
languages:
- ruby
tags:
---
Add the following to your AR model:


```ruby
def send_at_formatted
   self.send_at.strftime('%d.%m.%Y') if self.send_at?
end

def send_at_formatted=(value)
   self.send_at = Time.zone.parse(value)
end
```
    

Add the following to your JavaScript file:


```ruby
$(document).ready(function() {
  $('.date-select').each(function(index, element) {
    var elem = $(element),
        options = { format: '%d.%m.%Y', labelTitle: elem.data('title') };

    AnyTime.picker( elem.attr('id'), options );
  });
...
```
    

Add this to your HAML/ERB view:


```ruby
= f.text_field :send_at_formatted, :class => 'date-select', :"data-title" => 'Send at'
```
    

Download [Any+Time](http://www.ama3.com/anytime/) JS and CSS files and include them in your head tag.

