---
id: '495'
title: Will Paginate pagination helper
languages:
- ruby
tags:
---

```ruby
module ApplicationHelper
  def paginate(collection)
    if collection.previous_page && !collection.next_page
      will_paginate collection, :page_links => true, :next_label => "", :prev_label => "&laquo; Previous"
    elsif collection.next_page && !collection.previous_page
      will_paginate collection, :page_links => true, :next_label => "Next &raquo;", :prev_label => ""
    else
      will_paginate collection, :page_links => true, :next_label => "Next &raquo;", :prev_label => "&laquo; Previous"
    end
  end
end
```
    

