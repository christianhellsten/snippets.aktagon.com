---
id: '454'
title: Example of how to generate Javascript with Haml
languages:
- ruby
tags:
- '"edit conflict"'
- '"optimistic lock"'
- '"optimistic locking"'
- rails
---

```ruby
:javascript
  if($("@[data-name='#{@domain.name}']").length == 0) {
    $("table.domain-list tbody").prepend('#{escape_javascript(partial(:"domains/td"))}'); 
  }
```
    

